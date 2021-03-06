package com.shop.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.shop.mapper.ShopMapper;
import com.shop.vo.Buy;
import com.shop.vo.Cart;
import com.shop.vo.Product;
import com.shop.vo.Review;

public class ShopRepImpl implements ShopRep {

//	@Autowired
//	@Qualifier("shopMapper")
	private ShopMapper shopMapper;

	public ShopMapper getShopMapper() {
		return shopMapper;
	}

	public void setShopMapper(ShopMapper shopMapper) {
		this.shopMapper = shopMapper;
	}


	@Override
	public Product selectProductByProductNo(int productNo) {
		Product product = shopMapper.selectProductByProductNo(productNo);
		return product;
	}

	@Override
	public List<Product> selectProducts(HashMap<String, Object> params) {
		List<Product> products = shopMapper.selectProducts(params);
		return products;
	}

	@Override
	public List<HashMap<String, Object>> selectCategories() {
		List<HashMap<String, Object>> categorys = shopMapper.selectCategories();
		return categorys;
	}

	@Override
	public List<String> selectColors() {
		List<String> colors = shopMapper.selectColors();
		return colors;
	}

	@Override
	public List<Cart> selectCarts(String memberId) {
		List<Cart> carts = shopMapper.selectCarts(memberId);
		return carts;
	}

	@Override
	public void insertCart(Cart cart) {
		shopMapper.insertCart(cart);
	}

	@Override
	public void deleteCart(String[] cartNos) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();

		List<String> codeList = new ArrayList<String>();
		for (int i = 0; i < cartNos.length; i++) {
			codeList.add(cartNos[i]);
		}
		params.put("codeList", codeList);
		shopMapper.deleteCart(params);
	}

	@Override
	public void updateCartCntByCartNo(int cartNo, int count) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cartNo", cartNo);
		params.put("count", count);
		shopMapper.updateCartCntByCartNo(params);
	}

	@Override
	public List<Cart> findMyCartList(String memberId) {
		List<Cart> carts = shopMapper.findMyCartList(memberId);
		return carts;
	}
	
	public List<Cart> selectCheckoutList(String memberId, String[] cartNos) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);

		List<String> codeList = new ArrayList<String>();
		for (int i = 0; i < cartNos.length; i++) {
			codeList.add(cartNos[i]);
		}
		params.put("codeList", codeList);
		List<Cart> checkoutList = shopMapper.selectCheckoutList(params);
		return checkoutList;

	}

	@Override
	public void insertBuy(Buy buy) {
		shopMapper.insertBuy(buy);
	}

	@Override
	public Cart selectCartByCartNo(int cartNo) {
		Cart cart = shopMapper.selectCartByCartNo(cartNo);
		return cart;
	}

	@Override
	public void updateProductCountByBuy(int productNo, int count) {
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		params.put("productNo", productNo);
		params.put("count", count);
		shopMapper.updateProductCountByBuy(params);
	}

	@Override
	public List<Buy> selectLatelyBuyList(String memberId, int rows) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("rows", rows);
		List<Buy> buyList = shopMapper.selectLatelyBuyList(params);
		return buyList;
	}

	@Override
	public List<Buy> findMyBuyList(String memberId) {
		List<Buy> buyList = shopMapper.findMyBuyList(memberId);
		return buyList;
	}
	
	@Override
	public int selectProductsCount() {
		int count = shopMapper.selectProductsCount();
		return count;

	}
	@Override
	public void insertReview(Review review) {
		shopMapper.insertReview(review);
	}
	
	@Override
	public void updateReview(Review review) {
		shopMapper.updateReview(review);
	}
	
	@Override
	public void deleteReview(int reviewNo) {
		shopMapper.deleteReview(reviewNo);
	}

	@Override
	public ArrayList<Review> selectReviewsByProductNo(int productNo) {
		List<Review> reviews =
			shopMapper.selectReviewsByProductNo(productNo);
		return (ArrayList<Review>)reviews;
	}
	
	@Override
	public Review selectReviewByReviewNo(int reviewNo) {
		Review review =
			shopMapper.selectReviewByReviewNo(reviewNo);
		return review;
	}
	
	@Override
	public void updateReviewStep(Review review) {
		shopMapper.updateReviewStep(review);
	}
	
	@Override
	public void insertComment(Review review) {
		shopMapper.insertComment(review);
	}

	@Override
	public int selectBuyCountByMemberId(String memberId, int productNo) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("productNo", productNo);
		int buyCount = shopMapper.selectBuyCountByMemberId(params);
		return buyCount;
	}

	@Override
	public int selectProductsCountByCategory(HashMap<String, Object> params) {
		int productsCount = shopMapper.selectProductsCountByCategory(params);
		return productsCount;
	}

}
