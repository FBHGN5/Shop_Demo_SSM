#include "stdafx.h"
#include <iostream>
#include <boost/chrono.hpp>
#include <chrono>
#include <sstream>
#include <fstream>
#include <algorithm>
#include "mfcc.h"
#include "gmm.h"

#define FREQ 16000              //������16000Hz�����滻Ϊ48000Hz����ʹ��48000Hz����Ƶ�ļ�
#define TRAINSIZE FREQ*4        //ѵ������-4s
#define RECOGSIZE FREQ*1      //ʶ������-1s

using namespace std;
typedef std::chrono::high_resolution_clock Clock;
typedef std::chrono::milliseconds Milliseconds;

//��ȡPerson0-9��Ƿ�
string GetPersonName(int personId)
{
    ostringstream oss;
    oss << "Person" << personId;
    return oss.str();
}

//��ȡʶ��(0)��ѵ��(1)��ģ��(2)�ļ����ڵ���Ƶ(ģ��)�ļ���
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

//�����Ƶ�ļ�ͷ
void CheckWavHeader(char *header)
{
	int sr;
	//ѹ��������
	if (header[20] != 0x1)
		cout << endl << "Input audio file has compression [" << header[20] << "] and not required PCM" << endl;
	//�ֽ�����ͨ���������ʱ��
	sr = ((header[24] & 0xFF) | ((header[25] & 0xFF) << 8) | ((header[26] & 0xFF) << 16) | ((header[27] & 0xFF) << 24));
    cout << " " << (int)header[34] << " bits, " << (int)header[22] << " channels, " << sr << " Hz";
}

//����Ƶ�ļ�
size_t ReadWav(const string& filePath, short int voiceData[], size_t sizeData, size_t seek)
{
    ifstream inFile(filePath, ifstream::in|ifstream::binary);
    size_t ret;
    if(!inFile.is_open())
    {
        cout << endl << "Can not open the WAV file !!" << endl;
        return -1;
    }
	//��ȡ44���ֽڵ���Ƶͷ
    char waveheader[44];
    inFile.read(waveheader, 44);
    if(seek==0) CheckWavHeader(waveheader); //���ͷ�ļ���Ϣ
    if(seek!=0) inFile.seekg (seek*sizeof(short int), ifstream::cur); //�ƶ�ָ��λ�ã�����ȡ
    inFile.read(reinterpret_cast<char *>(voiceData), sizeof(short int)*sizeData);
    ret = (size_t)inFile.gcount()/sizeof(short int);
    inFile.close();
    return ret;
}

int main()
{
	//������������
	Clock::time_point trainStart, trainEnd, recogScoreStart, recogScoreEnd, recogPercentStart, recogPercentEnd;
    Milliseconds ms;
	string filePath;                       //��Ƶ�ļ�·��
	size_t realSize;                       //��Ƶ�ļ����ݳ���
    short int bigVoiceBuffer[TRAINSIZE];   //��Ƶ�ļ�һ����ʶ��
    short int littleVoiceBuffer[2000];     //��Ƶ�ļ�����ʽʶ��
	size_t frameCount;                     //MFCC֡��
    vector<vector<double>> melCepData;     //MFCCϵ��
	int loop;                              //GMMѭ������
	string name;                           //ʶ����persion0-9
	int goodScoreRecog = 0;                //��ȷʶ�����(һ����ʶ��)
	int goodPercentRecog = 0;              //��ȷʶ�����(����ʽʶ��)
	map<string, int> recogHits;            //����ʽʶ����

	Mfcc mfcc(16000, 16, 8, Mfcc::Hamming, 24, 12); //mfcc��÷��Ƶ�ʵ���ϵ��
    Gmm gmm;                                        //gmm����˹���ģʽ

	//GMMģ��ѵ��
    cout << "*** TRAINNING ***" << endl;
    trainStart = Clock::now();
    for(int personId=0; personId<=9; personId++) //����ÿ��������MFCCϵ������������Ӧ��GMMģ��
    {
        //����ѵ����Ƶ�ļ�
        filePath = GetFilePath(personId, 0, 1, "wav");
        cout << filePath;
        realSize = ReadWav(filePath, bigVoiceBuffer, TRAINSIZE, 0);
        if(realSize<1) continue;

        //MFCCϵ�����
        frameCount = mfcc.Analyse(bigVoiceBuffer,realSize);
        melCepData = mfcc.GetMFCCData();

        //GMMģ�ͽ���
        loop = gmm.Trainning(melCepData, frameCount);
        filePath = GetFilePath(personId, 0, 2, "gmm");
        gmm.SaveModel(filePath);
        cout << " : " << loop << " trainning loops" << endl;
    }
    trainEnd = Clock::now();

    //������������ѵ���õ�GMMģ��
    for(int personId=0; personId<=9; personId++)
    {
        filePath = GetFilePath(personId, 0, 2, "gmm");
        gmm.AddModel(filePath, GetPersonName(personId));
    }

	//һ����ʶ��
    cout << endl << "*** RECOGNITION best score ***" << endl;
    recogScoreStart = Clock::now();
    for(int personId=0; personId<=9; personId++)
    {
        for(int num=1; num<=3; num++)
        {
            //һ���Է�����Ƶ��MFCC
            filePath = GetFilePath(personId, num, 0, "wav");
            cout << filePath;
            realSize = ReadWav(filePath, bigVoiceBuffer, RECOGSIZE, 0);
            if(realSize<1) continue;
            frameCount = mfcc.Analyse(bigVoiceBuffer,realSize); //�Դ�ʶ�����Ƶ�źŽ���MFCC����
            melCepData = mfcc.GetMFCCData();
            name = gmm.Recogniser(melCepData, frameCount); //����MFCCϵ����GMMģ��ʶ��
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

	//����ʽʶ��
    cout << endl << "*** RECOGNITION best percentage ***" << endl;
    recogPercentStart = Clock::now();
    for(int personId=0; personId<=9; personId++)
    {
        for(int num=1; num<=3; num++)
        {
            //��2000��������Ϊ���������ʶ��
            bool bContinue = true;
			size_t position = 0;
            mfcc.StartAnalyse(RECOGSIZE);
            filePath = GetFilePath(personId, num, 0, "wav");
            cout << filePath;
            recogHits.clear();
            do
            {
                realSize = ReadWav(filePath, littleVoiceBuffer, 2000, position); //��2000��������
                bContinue = mfcc.AddBuffer(littleVoiceBuffer, realSize); //MFCC�ڴ�����ֹͣʶ��
                position += realSize;
                if(realSize!=2000) bContinue = false; //û�и������ݾ�ֹͣʶ��
                if(position>8000) //����������8000��ʼʶ��
                {
                    name = gmm.Recogniser(mfcc.GetMFCCData(), mfcc.GetFrameCount());
                    recogHits[name]++;
                }
            } while(bContinue);
			//ȡ���ʶ�����ʹμ�ʶ�������÷�Ϊ100����ʶ��׼ȷ
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
	// һ����ʶ�������ʽʶ�������
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
