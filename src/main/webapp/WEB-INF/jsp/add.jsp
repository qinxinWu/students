<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>学生添加</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript">
            $(function () {
                    var numFlag=false;
                    var nameFlag=false;
                    var clsFlag=false;
                    var ageFlag=false;
                    var genderFlag=false;


                $("#iName").blur(function () {
                        var name=$("#iName").val();

                        if(name!=null&&name!=""){
                            nameFlag=true;
                            $("#name_span").html("");
                        }else{
                            $("#name_span").html("名字为空，请输入！");
                            nameFlag=false;
                        }
                    })
                $("#iCls").blur(function () {
                    var cls=$("#iCls").val();

                    if(cls!=null&&cls!=""){
                        clsFlag=true;
                        $("#cls_span").html("");
                    }else{
                        $("#cls_span").html("班级为空，请输入！");
                        clsFlag=false;
                    }
                })

                $("#iAge").blur(function () {
                    var age=$("#iAge").val();

                    if(age!=null&&age!=""){
                        ageFlag=true;
                        $("#age_span").html("");
                    }else{
                        $("#age_span").html("年龄为空，请输入！");
                        ageFlag=false;
                    }
                })

                $("#iGender").blur(function () {
                    var gender=$("#iGender").val();

                    if(gender!=null&&gender!=""){
                        genderFlag=true;
                        $("#gender_span").html("");
                    }else{
                        $("#gender_span").html("性别为空，请输入！");
                        genderFlag=false;
                    }
                })





                    $("#iNum").blur(function () {
                        var num=$("#iNum").val();

                        $.ajax({
                            url:"checkStudent",
                            type:"post",
                            data:"num="+num,
                            dataType:"json",
                            success:function (data) {
                                if(data=="1"){
                                    numFlag=true;
                                    $("#num_span").html("");
                                }else{
                                    numFlag=false;
                                    $("#num_span").html("学号已存在,请更换！");
                                }

                            }


                        })

                    })


                    $("form").submit(function () {
                        if(numFlag&&nameFlag&&clsFlag&&ageFlag&&genderFlag){
                            return true;
                        }else{
                            return false;
                        }

                    })


                }
            );



        </script>




    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">学生管理系统</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="wel">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>欢迎页</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="view">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>学生信息列表</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="addPage">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>学生添加</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">






                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">





                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">




                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">点击登出</span>

                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">


                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        登出
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-gray-800">学生添加</h1>

                        <div class="row">

                            <div class="col-lg-12">



                                <!-- Brand Buttons -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">学生添加</h6>
                                    </div>
                                    <center>
                                        <div class="card-body" >
                                            <form action="add" method="post">
                                                <center><div>学号：<input type="text" id="iNum" name="num" placeholder="例如：1901210688"/></div><span style="color: red" id="num_span"></span></center>
                                                <br />
                                                <center><div>姓名：<input type="text" id="iName" name="name" placeholder="例如：小新"/></div><span style="color: red" id="name_span"></span></center>
                                                <br />
                                                <center><div>班级：<input type="text" id="iCls" name="cls" placeholder="例如：5年1班"/></div><span style="color: red" id="cls_span"></span></center>
                                                <br />
                                                <center><div>年龄：<input type="text" id="iAge" name="age" placeholder="例如：9"/></div><span style="color: red" id="age_span"></span></center>
                                                <br />
                                                <center><div>性别：<input type="text" id="iGender" name="gender" placeholder="例如：男"/></div><span style="color: red" id="gender_span"></span></center>
                                                <br />
                                                <center><input type="submit" value="提交" style="color: blue;"></center>

                                            </form>
                                        </div>
                                    </center>
                                </div>

                            </div>

                        </div>




                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; wqx Website 2019</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">确定要退出吗?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">确定退出点击登出按钮，取消退出点击取消按钮。</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                        <a class="btn btn-primary" href="/login.jsp">登出</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

    </body>

</html>

