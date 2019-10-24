<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>注册</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript">
            $(function () {
                var uFlag=false;
                var pFlag=false;

                $("#exampleInputPassword2").blur(function () {
                    var password=$("#exampleInputPassword").val();
                    var rPassword=$("#exampleInputPassword2").val();
                    if(password!=null&&password!=""&&password==rPassword){
                        pFlag=true;
                        $("#password_span").html("");
                    }else{
                        $("#password_span").html("密码为空或不一致,请重新输入！");
                        pFlag=false;
                    }


                })

                $("#exampleInputEmail").blur(function () {
                    var username=$("#exampleInputEmail").val();

                    $.ajax({
                        url:"checkUsername",
                        type:"post",
                        data:"username="+username,
                        dataType:"json",
                        success:function (data) {
                            if(data=="1"){
                                uFlag=true;
                                $("#user_span").html("");
                            }else{
                                uFlag=false;
                                $("#user_span").html("账号（用户名）已存在,请更换！");
                            }

                        }


                    })

                })


                $("form").submit(function () {
                    if(pFlag&&uFlag){
                        return true;
                    }else{
                        return false;
                    }

                })


                }
            );



        </script>


    </head>

    <body class="bg-gradient-primary">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">用户注册</h1>
                                        </div>
                                        <form class="user" action="register" method="post" >

                                            <div class="form-group">
                                                <input type="text" name="username" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="账号（用户名）">
                                            </div>
                                            <span style="color: red" id="user_span"></span>

                                            <div class="form-group">
                                                <input type="password" name="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="密码">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" name="password2" class="form-control form-control-user" id="exampleInputPassword2" placeholder="重复密码">
                                            </div>
                                            <span style="color: red" id="password_span"></span>

                                            <input type="submit" class="btn btn-primary btn-user btn-block" value="注册" />

                                        </form>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

    </body>

</html>

