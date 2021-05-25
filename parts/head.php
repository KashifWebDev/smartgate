<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<?php echo $dir; ?>images/logo.jpg" />

    <title><?php echo $page_title; ?></title>

    <!-- Custom fonts for this template-->
    <link href="<?php echo $dir; ?>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="<?php echo $dir; ?>vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<?php echo $dir; ?>css/sb-admin.css" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

    <!-- Bootstrap -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="<?php echo $dir; ?>js/custom.js"></script>

    <!-- FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Ubuntu|Exo+2|PT+Sans|Arimo|Oxygen" rel="stylesheet">

    <!-- Custom stylesSheets-->
    <link href="<?php echo $dir; ?>css/custom.css?v=<?php echo rand(); ?>" rel="stylesheet">




    <?php
    error_reporting(0);
    if($include_gauges=="yes"){
        ?>

        <script src="<?php echo $dir; ?>chart_js/Chart.bundle.js"></script>
        <script src="<?php echo $dir; ?>chart_js/utils.js"></script>
        <style>
            canvas{
                -moz-user-select: none;
                -webkit-user-select: none;
                -ms-user-select: none;
            }
            .openchart:hover{
                box-shadow: 0px 0px 20px 0px #7b7b7b;
                transition: all 0.5s ease;
            }
            .openchart{
                font-family: 'Exo', sans-serif;
                font-size: large;
                padding: 11px;
                font-weight: bold;
                text-align: center;
                color: #656565;
                border: 1px solid #9c9c9c;
                border-radius: 12px;
            }
        </style>

        <?php
    }

    ?>

</head>