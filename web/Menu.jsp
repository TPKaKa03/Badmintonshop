<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="Home">Shoes</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Manager Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">Hello ${sessionScope.account.user}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="show">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light">Mybag(${requestScope.size})items</span>
                </a>
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Hello ${sessionScope.account.user}</h1>
    
    </div>
</section>
<!--end of menu-->
