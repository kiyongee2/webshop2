package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.common.JDBCUtil;
import vo.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	private static ProductRepository instance = new ProductRepository();
	//db 연동 관련 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	//생성자
	private ProductRepository() {}
	
	//상품 목록
	public ArrayList<Product> getAllProducts(){
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Product product = new Product();
				product.setProductId(rs.getString("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setUnitsInStock(rs.getLong("p_unitsInStock"));
				product.setCondition(rs.getString("p_condition"));
				product.setProductImage(rs.getString("p_productImage"));
				listOfProducts.add(product);  //리스트에 저장
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return listOfProducts;
	}
	
	//상품 상세 보기
	public Product getProductById(String productId) {
		Product product = new Product();
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM product WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				product.setProductId(rs.getString("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setUnitsInStock(rs.getLong("p_unitsInStock"));
				product.setCondition(rs.getString("p_condition"));
				product.setProductImage(rs.getString("p_productImage"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return product;
	}
}