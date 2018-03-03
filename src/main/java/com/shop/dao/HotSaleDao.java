package com.shop.dao;

        import com.shop.entity.HotSale;
        import org.apache.ibatis.annotations.Param;

        import java.util.List;

public interface HotSaleDao {

    List<HotSale> queryAll();
    HotSale queryById(int id);
    int  deleteById(int id);
    int reduceNumber(@Param("id") int hotid,@Param("num") int num);
    // int update(@Param("name") String name,@Param("number") int num);
    int update(@Param("id") int id,@Param("number") int number,@Param("price")int price);
    int insert(@Param("username") String username,@Param("name") String name,
               @Param("price")int price,@Param("img") String img,@Param("number") int number,
               @Param("wimg") String wimg,@Param("bimg") String bimg,@Param("buycarimg")String buycarimg);
}
