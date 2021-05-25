<?php
$page_title="Reports";
$current_page="Reports" ;
$redirec="admin";
$dir="../";
require 'common.php';

?>


<h3 id="top-nav-font">Search a User/Group to generate Report.</h3>
<!-- DataTables Example -->

<?php require 'report-list-view.php'; ?>




      <!-- Sticky Footer -->
      <?php require '../parts/footer.php'; ?>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="<?php echo $dir; ?>vendor/jquery/jquery.min.js"></script>
  <script src="<?php echo $dir; ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<?php echo $dir; ?>vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="<?php echo $dir; ?>vendor/chart.js/Chart.min.js"></script>
  <script src="<?php echo $dir; ?>vendor/datatables/jquery.dataTables.js"></script>
  <script src="<?php echo $dir; ?>vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<?php echo $dir; ?>js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="<?php echo $dir; ?>js/demo/datatables-demo.js"></script>
  <script src="<?php echo $dir; ?>js/demo/chart-area-demo.js"></script>
  <script>
        //Pi Chart
      Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      Chart.defaults.global.defaultFontColor = '#292b2c';

      // Pie Chart Example
      var ctx = document.getElementById("myPieChart");
      var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
          labels: ["ON", "OFF"],
          datasets: [{
            data: [<?php echo $deivces_on; ?>, <?php echo $deivces_off; ?>],
            backgroundColor: ['#008000a3', '#ff0000c4'],
          }],
        },
      });

  </script>

</body>

</html>
