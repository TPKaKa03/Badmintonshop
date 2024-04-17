<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                            <ul class="list-group category_block">
                            <c:forEach items="${listCC}" var="o">
                                <li class="list-group-item text-white"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                                </c:forEach>
                        </ul>
                    </div>

                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Last product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${pa.image}" />
                            <h5 class="card-title">${pa.id}</h5>
                            <p class="card-text">${pa.name}</p>
                            <p class="bloc_left_price">${pa.price}</p>
                            <a href="detail?pid=${pa.id}" class="btn btn-success btn-block">Add to cart</a>
                        </div>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Same product</div>
                        <c:forEach items="${requestScope.listtop}" var="o">
                            <%--<c:forEach items="${requestScope.data}" var="i" >--%>
                            <%--<c:if test="${i.cateID == o.cateID}">--%>
                            <div class="card">

                                <img class="img-fluid"  src="${o.image}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-text">><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>                                    
                                    <div class="row">
                                        <div class="col">
                                            <p class="bloc_left_price">${o.price}</p>
                                        </div>
                                        <div class="col">
                                            <a href="detail?pid=${o.id}"  class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--</c:if>--%>
                        </c:forEach>
                        <%--</c:forEach>--%>
                    </div>
                </div>                   

                <div class="col-sm-9">
                    <div class="container">                        
                        <div class="row">
                            <aside class="col-sm-5 border-right">
                                <article class="gallery-wrap"> 
                                    <div class="img-big-wrap">
                                        <div> <a href="#"><img src="${detail.image}"></a></div>
                                    </div> 
                                    <div class="img-small-wrap">

                                    </div> 
                                </article> 
                            </aside>
                            <aside class="col-sm-7">
                                <article class="card-body p-5">
                                    <h3 class="title mb-3">${detail.name}</h3>

                                    <p class="price-detail-wrap"> 
                                        <span class="price h3 text-warning"> 
                                            <span class="currency">US $</span><span class="num">${detail.price}</span>
                                        </span> 

                                    </p>
                                    <dl class="item-property">
                                        <dt>Description</dt>
                                        <dd><p>${detail.title} </p></dd>
                                    </dl>


                                    <hr>                                
                                    </div> 
                                    <hr>
                                    <form action="detail" name="form" method="post">
                                        <input type="hidden" name="pid" value="${detail.id}" />
                                        <div class="table-responsive mb-2">
                                            <table class="table table-sm table-borderless">
                                                <tbody>
                                                    <tr>
                                                        <td class="pl-0 pb-0 w-25">Quantity</td>
                                                        <td class="pb-0">Select size</td>
                                                    </tr>                                          
                                                    <tr>
                                                        <td class="pl-0">
                                                            <div class="mt-1">
                                                                <div class="def-number-input number-input safari_only mb-0" style="display: flex; align-items: center;">
                                                                    <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                                                            class="minus"></button>
                                                                    <input class="quantity" min="0" name="quantity" required="" type="number">
                                                                    <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                                                            class="plus"></button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="mt-1">
                                                                <div class="form-check form-check-inline pl-0">
                                                                    <input type="radio" class="form-check-input" id="small" value="1" name="size" checked>
                                                                    <label class="form-check-label small text-uppercase card-link-secondary"
                                                                           for="small">Small(3U)</label>
                                                                </div>
                                                                <div class="form-check form-check-inline pl-0">
                                                                    <input type="radio" class="form-check-input" id="medium" value="2" name="size">
                                                                    <label class="form-check-label small text-uppercase card-link-secondary"
                                                                           for="medium">Medium(4U)</label>
                                                                </div>
                                                                <div class="form-check form-check-inline pl-0">
                                                                    <input type="radio" class="form-check-input" id="large" value="3" name="size">
                                                                    <label class="form-check-label small text-uppercase card-link-secondary"
                                                                           for="large">Large(5U)</label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="mt-1">
                                            <button type="submit" class="btn btn-primary btn-md mr-1 mb-2">Buy now</button>
                                            <button type="submit" class="btn btn-light btn-md mr-1 mb-2"><i class="fas fa-shopping-cart pr-2"></i>Add to
                                                cart</button>
                                        </div>
                                    </form>
                                    </div>
                                    </div> 
                                    </div>
                                    </div> 
                                    <div >
                                    </div>



                                    <!-- Footer -->
                                    <footer class="text-light">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3 col-lg-4 col-xl-3">
                                                    <h5>About</h5>
                                                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                                                    <p class="mb-0">
                                                        Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                                                    </p>
                                                </div>

                                                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                                                    <h5>Informations</h5>
                                                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                                                    <ul class="list-unstyled">
                                                        <li><a href="">Link 1</a></li>
                                                        <li><a href="">Link 2</a></li>
                                                        <li><a href="">Link 3</a></li>
                                                        <li><a href="">Link 4</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                                                    <h5>Others links</h5>
                                                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                                                    <ul class="list-unstyled">
                                                        <li><a href="https://www.youtube.com/@trinhthivananhtrinhblog6313">About me</a></li>

                                                    </ul>
                                                </div>

                                                <div class="col-md-4 col-lg-3 col-xl-3">
                                                    <h5>Contact</h5>
                                                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                                                    <ul class="list-unstyled">
                                                        <li><i class="fa fa-home mr-2"></i> FPT University</li>
                                                        <li><i class="fa fa-envelope mr-2"></i> thangkak317@gmail.com</li>
                                                        <li><i class="fa fa-phone mr-2"></i> + 0968727492</li>

                                                    </ul>
                                                </div>
                                                <div class="col-12 copyright mt-3"> 
                                                    <p class="float-left">
                                                        <a href="#">Back to top</a>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </footer>
                                    </body>
                                    </html>

                                    <script>

                                    </script>
