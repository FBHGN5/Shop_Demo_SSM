#include "stdafx.h"
#include <iostream>
#include <boost/chrono.hpp>
#include <chrono>
#include <sstream>
#include <fstream>
#include <algorithm>
#include "mfcc.h"
#include "gmm.h"

#define FREQ 16000              //采样率16000Hz，可替换为48000Hz，以使用48000Hz的音频文件
#define TRAINSIZE FREQ*4        //训练样本-4s
#define RECOGSIZE FREQ*1      //识别样本-1s

using namespace std;
typedef std::chrono::high_resolution_clock Clock;
typedef std::chrono::milliseconds Milliseconds;

//获取Person0-9标记符
string GetPersonName(int personId)
{
    ostringstream oss;
    oss << "Person" << personId;
    return oss.str();
}

//获取识别(0)、训练(1)和模型(2)文件夹内的音频(模型)文件名
string GetFilePath(int person, int num, int mode, const string& extention)
{
    ostringstream oss;
    switch(mode)
    {
        case 0 :
            oss << "recog/F0" << person << "_" << num << "-" << FREQ << "." << extention;
            break;
        case 1 :
            oss << "train/F0" << person << "-" << FREQ << "." << extention;
            break;
        case 2 :
            oss << "model/" << person << "." << extention;
            break;
    }
    return oss.str();
}

//检查音频文件头
void CheckWavHeader(char *header)
{
	int sr;
	//压缩编码标记
	if (header[20] != 0x1)
		cout << endl << "Input audio file has compression [" << header[20] << "] and not required PCM" << endl;
	//字节数、通道、采样率标记
	sr = ((header[24] & 0xFF) | ((header[25] & 0xFF) << 8) | ((header[26] & 0xFF) << 16) | ((header[27] & 0xFF) << 24));
    cout << " " << (int)header[34] << " bits, " << (int)header[22] << " channels, " << sr << " Hz";
}

//读音频文件
size_t ReadWav(const string& filePath, short int voiceData[], size_t sizeData, size_t seek)
{
    ifstream inFile(filePath, ifstream::in|ifstream::binary);
    size_t ret;
    if(!inFile.is_open())
    {
        cout << endl << "Can not open the WAV file !!" << endl;
        return -1;
    }
	//读取44个字节的音频头
    char waveheader[44];
    inFile.read(waveheader, 44);
    if(seek==0) CheckWavHeader(waveheader); //输出头文件信息
    if(seek!=0) inFile.seekg (seek*sizeof(short int), ifstream::cur); //移动指针位置，并读取
    inFile.read(reinterpret_cast<char *>(voiceData), sizeof(short int)*sizeData);
    ret = (size_t)inFile.gcount()/sizeof(short int);
    inFile.close();
    return ret;
}

int main()
{
	//参数声明定义
	Clock::time_point trainStart, trainEnd, recogScoreStart, recogScoreEnd, recogPercentStart, recogPercentEnd;
    Milliseconds ms;
	string filePath;                       //音频文件路径
	size_t realSize;                       //音频文件数据长度
    short int bigVoiceBuffer[TRAINSIZE];   //音频文件一次性识别
    short int littleVoiceBuffer[2000];     //音频文件增量式识别
	size_t frameCount;                     //MFCC帧数
    vector<vector<double>> melCepData;     //MFCC系数
	int loop;                              //GMM循环次数
	string name;                           //识别标号persion0-9
	int goodScoreRecog = 0;                //正确识别个数(一次性识别)
	int goodPercentRecog = 0;              //正确识别个数(增量式识别)
	map<string, int> recogHits;            //增量式识别结果

	Mfcc mfcc(16000, 16, 8, Mfcc::Hamming, 24, 12); //mfcc，梅尔频率倒谱系数
    Gmm gmm;                                        //gmm，高斯混合模式

	//GMM模型训练
    cout << "*** TRAINNING ***" << endl;
    trainStart = Clock::now();
    for(int personId=0; personId<=9; personId++) //分析每个样本的MFCC系数，并建立相应的GMM模型
    {
        //读入训练音频文件
        filePath = GetFilePath(personId, 0, 1, "wav");
        cout << filePath;
        realSize = ReadWav(filePath, bigVoiceBuffer, TRAINSIZE, 0);
        if(realSize<1) continue;

        //MFCC系数求解
        frameCount = mfcc.Analyse(bigVoiceBuffer,realSize);
        melCepData = mfcc.GetMFCCData();

        //GMM模型建立
        loop = gmm.Trainning(melCepData, frameCount);
        filePath = GetFilePath(personId, 0, 2, "gmm");
        gmm.SaveModel(filePath);
        cout << " : " << loop << " trainning loops" << endl;
    }
    trainEnd = Clock::now();

    //重新载入所有训练好的GMM模型
    for(int personId=0; personId<=9; personId++)
    {
        filePath = GetFilePath(personId, 0, 2, "gmm");
        gmm.AddModel(filePath, GetPersonName(personId));
    }

	//一次性识别
    cout << endl << "*** RECOGNITION best score ***" << endl;
    recogScoreStart = Clock::now();
    for(int personId=0; personId<=9; personId++)
    {
        for(int num=1; num<=3; num++)
        {
            //一次性分析音频的MFCC
            filePath = GetFilePath(personId, num, 0, "wav");
            cout << filePath;
            realSize = ReadWav(filePath, bigVoiceBuffer, RECOGSIZE, 0);
            if(realSize<1) continue;
            frameCount = mfcc.Analyse(bigVoiceBuffer,realSize); //对待识别的音频信号进行MFCC分析
            melCepData = mfcc.GetMFCCData();
            name = gmm.Recogniser(melCepData, frameCount); //基于MFCC系数的GMM模型识别
            if(name == GetPersonName(personId))
            {
                cout << " recognize correctly :)" << endl;
                goodScoreRecog++;
            }
            else
            {
                cout << " recognize wrong " << name << " !!!" << endl;
            }
        }
    }
    recogScoreEnd = Clock::now();
    cout << endl;

	//增量式识别
    cout << endl << "*** RECOGNITION best percentage ***" << endl;
    recogPercentStart = Clock::now();
    for(int personId=0; personId<=9; personId++)
    {
        for(int num=1; num<=3; num++)
        {
            //以2000个采样点为增量，逐次识别
            bool bContinue = true;
			size_t position = 0;
            mfcc.StartAnalyse(RECOGSIZE);
            filePath = GetFilePath(personId, num, 0, "wav");
            cout << filePath;
            recogHits.clear();
            do
            {
                realSize = ReadWav(filePath, littleVoiceBuffer, 2000, position); //读2000个采样点
                bContinue = mfcc.AddBuffer(littleVoiceBuffer, realSize); //MFCC内存满则停止识别
                position += realSize;
                if(realSize!=2000) bContinue = false; //没有更多数据就停止识别
                if(position>8000) //数据量大于8000则开始识别
                {
                    name = gmm.Recogniser(mfcc.GetMFCCData(), mfcc.GetFrameCount());
                    recogHits[name]++;
                }
            } while(bContinue);
			//取最佳识别结果和次佳识别结果，得分为100表明识别准确
			auto it1 = max_element(recogHits.cbegin(), recogHits.cend(), [](const pair<string, int>& p1, const pair<string, int>& p2) { return p1.second < p2.second; });
            name = it1->first;
            int score = it1->second;
            recogHits[name] = 0;
            it1 = max_element(recogHits.cbegin(), recogHits.cend(), [](const pair<string, int>& p1, const pair<string, int>& p2) { return p1.second < p2.second; });
			cout << " " << name << " " << score*100/(score+it1->second) << "%";
			if(name == GetPersonName(personId))
            {
                cout << " correctly :)" << endl;
                goodPercentRecog++;
            }
            else
            {
                cout << " wrong !!!" << endl;
            }
        }
    }
    recogPercentEnd = Clock::now();
    cout << endl;
	// 一次性识别和增量式识别结果输出
    cout << "Recognition by score rate " << goodScoreRecog*100/30 << "%" << endl;
    cout << "Recognition by % rate " << goodPercentRecog*100/30 << "%" << endl;
    ms = std::chrono::duration_cast<Milliseconds>(trainEnd - trainStart);
   	cout << "Training time " << ms.count() << " ms (" << ms.count()/8 << " by train)" << endl;
    ms = std::chrono::duration_cast<Milliseconds>(recogScoreEnd - recogScoreStart);
	cout << "Recognition by score time " << ms.count() << " ms (" << ms.count()/24 << " by recog)" << endl;
    ms = std::chrono::duration_cast<Milliseconds>(recogPercentEnd - recogPercentStart);
	cout << "Recognition by percentage time " << ms.count() << " ms (" << ms.count()/24 << " by recog)" << endl;

    return 0;
}
