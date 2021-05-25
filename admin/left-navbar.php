<ul class="sidebar navbar-nav">
      <li class="nav-item <?php if($page_title=="Home"){echo "active"; } ?>">
        <a class="nav-link" href="dashboard.php">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
    <li class="nav-item <?php if($page_title=="Add User"){echo "active"; } ?>">
        <a class="nav-link" href="add-user.php">
            <i class="far fa-address-book"></i>
            <span>Add New User</span>
        </a>
    </li>
    <li class="nav-item <?php if($page_title=="Add New Group"){echo "active"; } ?>">
        <a class="nav-link" href="add-company.php">
            <i class="far fa-address-card"></i>
            <span>Add/View Groups</span>
        </a>
    </li>
    <li class="nav-item <?php if($page_title=="Reports"){echo "active"; } ?>">
        <a class="nav-link" href="reprots.php">
            <i class="fa fa-list-ol" aria-hidden="true"></i>
            <span>Reports</span></a>
    </li>
      <!--- Add new device
      <li class="nav-item <?php if($page_title=="Register A New Device"){echo "active"; } ?>">
        <a class="nav-link" href="add.php">
          <i class="fas fa-fw fa-plus"></i>
          <span>Assign devices to users</span></a>
      </li>
      <li class="nav-item <?php if($page_title=="Home"){echo "active"; } ?>">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
    <li class="nav-item <?php if($page_title=="Registered Devices"){echo "active"; } ?>">
        <a class="nav-link" href="devices.php">
            <i class="fas fa-fw fa-table"></i>
            <span>Registered Devices</span></a>
    </li>-->
    </ul>
  <?php $page_title=""; ?>