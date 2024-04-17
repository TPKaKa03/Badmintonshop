<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="./Css/style.css" rel="stylesheet" type="text/css"/>

        <script>
            function setCheck1(obj) {
                var fries = document.getElementsByName('price');

                if (obj.id === 'g0' && obj.checked === true) {
                    // If the "All" checkbox is checked, uncheck all other checkboxes
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    // If any other checkbox is checked, uncheck the "All" checkbox
                    fries[0].checked = false;
                }

                document.getElementById('f2').submit();
            }


        </script>
    </head>

    <style>
        .store-sort {
            display: flex;
            align-items: center;
        }

        label {
            margin-right: 10px;
            font-weight: bold;
        }

        .input-select {

            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: #fff;
            width: fit-content;
        }

        /* Customize the select arrow */
        .input-select::after {
            content: "\25BC"; /* Unicode down arrow character */
            position: absolute;
            top: 8px;
            right: 8px;

        }

        /* Style the options */
        .input-select option {
            font-size: 14px;
            background-color: #fff;
        }

        /* Hover effect for the select */
        .input-select:hover {
            border-color: #007bff;
        }

        /* Focus effect for the select */
        .input-select:focus {
            border-color: #007bff;
        }

        .container-fluid {
            margin-left: 30px;
            box-sizing: border-box; /* Đặt hộp đường viền (border-box) cho khối div */
            border: none; /* Loại bỏ đường viền mặc định */
            padding: 2px; /* Đặt khoảng trắng bên trong theo ý muốn */
            text-align: center; /* Canh giữa nội dung trong khối */
            border-radius: 10px; /* Làm tròn góc khối */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Thêm đổ bóng với màu sắc và độ trong suốt */
        }

        .filter input[type="checkbox"] {
            margin-right: 10px; /* Tạo khoảng cách giữa các checkbox */
        }

        .filter input[type="submit"] {
            margin-top: 10px; /* Tạo khoảng cách giữa checkbox và nút tìm kiếm */
            font-size: 20px;
            background-color: #555;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
            border-radius: 5px; /* Làm tròn góc nút tìm kiếm */
        }

        .filter input[type="submit"]:hover {
            background-color: #0056b3; /* Hiệu ứng hover khi di chuột qua nút tìm kiếm */
        }
        /* Thêm hình ảnh banner */
        .header-first {
            background-color: #18C0DF; /* Màu nền của div */
            padding: 20px; /* Khoảng cách giữa nội dung và viền của div */
            text-align: center; /* Căn giữa nội dung theo chiều ngang */
            margin-top: 20px; /* Tạo khoảng cách giữa div và các phần khác trên trang */
        }

        .header-first h1 {
            font-size: 24px; /* Kích thước chữ cho tiêu đề h1 */
            color: #333; /* Màu chữ cho tiêu đề h1 */
        }

        .header-first p {
            font-size: 18px; /* Kích thước chữ cho đoạn văn bản p */
            color: #555; /* Màu chữ cho đoạn văn bản p */
        }
        .filter{
            margin-bottom: 0.5rem;
            font-family: inherit;
            font-weight: 500;
            line-height: 1.2;
            color: inherit;
            display: flex;
            margin: 0 auto;
            margin-left: 112px
        }


    </style>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <h3>${requestScope.ms}</h3>
                <a class="navbar-brand" href="Home">Badminton'Win</a>
                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item">
                            <c:if test="${sessionScope.account !=null}">
                                <c:if test="${sessionScope.account.isSell ==1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="manager">Manage Product</a>
                                <li class="nav-item">
                                    <a class="nav-link" href="LeftAdmin.jsp">Doanh so</a>
                                </li>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.account.isAdmin==1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="LeftAdmin.jsp">Doanh so</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link"class="nav-link" href="EditProfile.jsp" >Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="change.jsp">Change Password</a>
                            </li> 

                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link">Hello ${sessionScope.account.user}</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account ==null}">
                            <li class="nav-item">
                                <a class="nav-link"  href="register.jsp">Register</a>
                            </li>
                            <li class="nav-item">   
                                <a class="nav-link" href="login">Login</a>
                            </li>   

                            <li class="nav-item">
                                <a class="nav-link" href="forgotPassword">Forgot Password</a>
                            </li>

                        </c:if>

                    </ul>

                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-success btn-sm ml-3" href="show">
                            <i class="fa fa-shopping-cart"></i> 
                            <span class="badge badge-light">${size}</span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <section class="jumbotron text-center">
            <div class="container">
                <h2 style=" font-family: cursive;
                    font-size: 2rem;
                    color: aqua; ">You are welcome</h2>
                <img style="width: 99%" src="https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-badminton-competition-advertising-background-image_155002.jpg" alt="Shop cầu lông chất lượng cao" />
            </div>
        </section>
        <!--end of menu-->

        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home">Home</a></li>
                            <!--                            <li class="breadcrumb-item"><a href="Home">Category</a></li>-->
                            <li class="breadcrumb-item"><a href="top10">Sản phẩm bán chạy </a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <form action="Home" method="post">
                        <div class="store-sort">
                            <label for="sort-select">Sort By:</label>
                            <select id="sort-select" class="input-select" name="sortOption">
                                <option value="0">Price ascending</option>
                                <option value="1">Price descending</option>
                            </select>
                        </div>
                        <button class="btn btn-success btn-block" type="submit">Submit</button>
                    </form>

                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCC}" var="o">
                                <li class="list-group-item text-white"><a href="category?id=${o.cid}">${o.cname}</a></li>
                                </c:forEach>

                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Sale product</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${p.image}" />
                            <h5 class="card-title">${p.id}</h5>
                            <p class="card-text">${p.name}</p>
                            <p class="bloc_left_price">${p.price}</p>
                            <a href="detail?pid=${p.id}" class="btn btn-success btn-block">Add to cart</a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-9">

                    <div class="row">
                        <div>
                            <div style="display: flex; justify-content: center; align-items: center; flex-direction: row; text-align: center;">
                                <form id="f2" action="filter" method="POST" style="display: flex; justify-content: center; align-items: center; flex-direction: column; text-align: center;">
                                    <div class="container-fluid">
                                        <h5 class="filter">
                                            <input type="checkbox" id="g0" name="price" ${pb[0]?"checked":""} value="0" onclick="setCheck1(this)"/>All
                                            <c:forEach begin="0" end="${2}" var="i">
                                                <input type="checkbox" id="g1" name="price"
                                                       ${pb[i+1]?"checked":""} value="${(i+1)}" onclick="setCheck1(this)"/>${pp[i]}<br/>
                                            </c:forEach>
                                        </h5>
                                    </div>
                                </form>
                            </div>


                        </div>
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">

                                <div class="card">

                                    <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">  </p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price}</p>
                                            </div>
                                            <div class="col">
                                                <a href="detail?pid=${o.id}"  class="btn btn-success btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div >
                            <div >
                                <c:forEach begin="1" end="${endP}" var="i">
                                    <a class="list-unstyled"  href="Home?index=${i}">${i}</a>
                                </c:forEach>
                            </div>


                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3">
                        <h5>About</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <p class="mb-0">
                            Badminton'WIN Sports là hệ thống cửa hàng cầu lông với hơn 50 chi nhánh trên toàn quốc, cung cấp sỉ và lẻ các mặt hàng dụng cụ cầu lông từ phong trào tới chuyên nghiệp
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h5>Chính sách </h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="">Chính sách đổi trả, hoàn tiền</a></li>
                            <li><a href="">Chính sách bảo hành </a></li>
                            <li><a href="">Chính sách xử lý khiếu lại </a></li>
                            <li><a href="">Chính sách bảo mật thông tin</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                        <h5>Hướng dẫn</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="https://shopvnb.com/tap-huan-tennis.html">Tìm hiểu công việc tập huấn tennis trước khi tổ chức giải đấu</a></li>
                            <li><a href="https://shopvnb.com/huong-dan-cach-chon-vot-cau-long-cho-nguoi-moi-choi.html">Hướng dẫn cách chọn vợt cầu lông cho người mới chơi</a></li>
                            <li><a href="https://shopvnb.com/cach-tap-tennis-cho-nguoi-moi-choi.html">Hướng dẫn cách tập cho người mới chơi</a></li>
                            <li><a href="">Kiểm tra đơn hàng</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3">
                        <h5>Contact</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-home mr-2"></i> FPT University</li>
                            <li><i class="fa fa-envelope mr-2"></i> votcaulonguytin@gmail.com.com</li>
                            <li><i class="fa fa-phone mr-2"></i> + 0968727492</li   >
                            <li><i class="fa fa-print mr-2"></i> + 123456789</li>
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

