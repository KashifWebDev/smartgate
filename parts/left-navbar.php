<ul class="sidebar navbar-nav">
      <li class="nav-item <?php if($page_title=="Home"){echo "active"; } ?>">
        <a class="nav-link" href="dashboard.php">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <!--- Add new device -->
      <li class="nav-item <?php if($page_title=="Register A New Device"){echo "active"; } ?>">
        <a class="nav-link" href="add.php">
          <i class="fas fa-fw fa-plus"></i>
          <span>Add New Device</span></a>
      </li>
      <!--
      <li class="nav-item <?php if($page_title=="Home"){echo "active"; } ?>">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      -->
    <li class="nav-item <?php if($page_title=="Registered Devices"){echo "active"; } ?>">
        <a class="nav-link" href="devices.php">
            <i class="fas fa-fw fa-table"></i>
            <span>Registered Devices</span></a>
    </li>
    <li class="nav-item <?php if($page_title=="Live Location"){echo "active"; } ?>">
        <a class="nav-link" href="live-map.php">
            <i class="fas fa-fw fa-map-marker"></i>
            <span>Live Locations</span></a>
    </li>
    </ul>
  <?php $page_title=""; ?>