<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="nav" value="meneger" scope="request"/>
<c:set var="title" value="Aroma Shop - ManageMent" scope="request"/>
<jsp:include page="../include/header.jsp"/>
  <!--================Checkout Area =================-->
  <section>
  <jsp:include page="../include/sidebar.jsp"/>
    <div class="container" id="content">
        <div class="billing_details">
            <div class="row">
                <div>
                    <h3>상품수정하기</h3>
                    <form class="row contact_form" action="/shop/manager/update-product" method="post" enctype="multipart/form-data" novalidate="novalidate" id="updateForm">
                        <input type="hidden" name="productNo" value="${ product.productNo }">
                        <div class="col-md-12 form-group p_star">
	                        <label>카테고리</label>
	                            <select name="category" class="country_select">
	                                <option value="가구" <c:if test="${ product.category eq '가구' }">selected</c:if>>가구</option>
	                                <option value="가전" <c:if test="${ product.category eq '가전' }">selected</c:if>>가전</option>
	                                <option value="그릇/홈세트" <c:if test="${ product.category eq '그릇/홈세트' }">selected</c:if>>그릇/홈세트</option>
	                                <option value="주방" <c:if test="${ product.category eq '주방' }">selected</c:if>>주방</option>
	                                <option value="홈데코" <c:if test="${ product.category eq '홈데코' }">selected</c:if>>홈데코</option>
	                            </select>
                        </div>
                        <div class="col-md-12 form-group">
                        	<label>상품 타이틀</label>
                            	<input type="text" class="form-control" id="company" name="title" value="${ product.title }">
                        </div>
                        <div class="col-md-4 form-group p_star">
                        	<label>상품명</label>
                            <input type="text" class="form-control" id="first" name="productName" value="${ product.productName }">
                            <span class="placeholder" data-placeholder="First name"></span>
                        </div>
                        <div class="col-md-4 form-group p_star">
                        	<label>색상</label>
                            <input type="text" class="form-control" id="last" name="color" value="${ product.color }">
                            <span class="placeholder" data-placeholder="Last name"></span>
                        </div>
                        <div class="col-md-4 form-group p_star">
                        	<label>사이즈</label>
                            <input type="text" class="form-control" id="last" name="size" vlaue="${ product.size }">
                            <span class="placeholder" data-placeholder="Last name"></span>
                        </div>
                        <div class="col-md-12 form-group">
                        <label>재고</label>
                            <input type="text" class="form-control" id="number" name="count" value="${ product.count }">
                            <span class="placeholder" data-placeholder="Phone number"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">
                        <label>가격</label>
                            <input type="text" class="form-control" id="number" name="price" value="${ product.price }">
                            <span class="placeholder" data-placeholder="Phone number"></span>
                        </div>
						<div class="col-md-8 form-group">
							<span class="tit">대표이미지<span class="ico_required">
									*</span></span>
							<p class="option">2048 *1158 권장, 최대 3MB</p>
							<div class="file ">
								<div class="inner inner_img">
									<img
										src="/shop/resources/files/product-files/${ product.file.fileName }"
										class="fileImg">
								</div>
								<div class="btn_box">
									<label class="titleImgBtn btn" for="titleImgFile"><div>파일첨부</div>
										<input type="file" class="_fileRel" name="titleImgFile"
										id="titleImgFile" accept="image/*" style="display: none;"></label>
								</div>
							</div>
							<p class="p_guide warn">
								<i class="sp_icon ico_alert"></i>대표이미지는 필수 입력입니다.
							</p>
						</div>
						<div class="col-md-12 form-group box_form">
								<span class="tit">이미지<label for="sp_adrs"><span class="ico_required">*</span></label></span>
								<p class="option">
									2048 * 1158 권장, 한 장당 최대 3MB<span class="txt_guide">(최대 10장)</span>
								</p>
								<div class="file"> 
									<div class="inner inner_imgs row">
										<c:forEach var="file" items="${ product.files }" varStatus="i">
											<div class="col-md-3" style="top:-25px">
												<div class="img-wrap mt-4">
													<span class="close" data-fileNo="${ file.productFileNo }">&times;</span>
													<img src="/shop/resources/files/product-files/${ file.fileName }" class="fileImg m-0">
												</div>
											</div>
										</c:forEach>
										
										</div>
									<div class="btn_box">
										<label class="imgBtn btn" for="imgFile"><div>파일첨부</div> 
											<input type="file" class="_fileRel" name="imgFile" id="imgFile" style="display: none;"
												accept="image/*" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)" multiple>
										</label>
									</div>
								</div>
							</div>
                        <div class="col-md-12 form-group mb-0">
                          <label>설명</label>
                            <textarea class="form-control" name="content" id="message" rows="1" placeholder="설명을 자유롭게 입력하세요">${ product.content }</textarea>
                        </div>
                        <div class="py-3 offset-md-11">
                        	<input type="submit" class="btn btn-primary" value="상품등록">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->
<jsp:include page="../include/footer.jsp"/> 