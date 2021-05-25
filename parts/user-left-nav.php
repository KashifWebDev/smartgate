<ul class="sidebar navbar-nav">
    <li class="nav-item <?php if($page_title=="Home"){echo "active"; } ?>">
        <a class="nav-link" href="dashboard.php">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <!--- Requests History -->
    <li class="nav-item <?php if($page_title=="Device Requests"){echo "active"; } ?>">
        <a class="nav-link" href="requests.php">
            <i class="fas fa-fw fa-table"></i>
            <span>Requests History</span></a>
    </li><!--
    <li class="nav-item <?php if($page_title=="Update Details"){echo "active"; } ?>">
        <a class="nav-link" href="edit_user.php">
            <i class="fas fa-user-edit"></i>
            <span>Update Details</span></a>
    </li>-->
    <li class="nav-item <?php if($page_title=="Create Schedule"){echo "active"; } ?>">
        <a class="nav-link" href="create-scheduling.php">
            <i class="fa fa-calendar" aria-hidden="true"></i>
            <span>Add Schedule</span></a>
    </li>
    <li class="nav-item <?php if($page_title=="All Schedules"){echo "active"; } ?>">
        <a class="nav-link" href="list-all-schedules.php">
            <i class="fa fa-calendar" aria-hidden="true"></i>
            <span>Schedules</span></a>
    </li>
    <li class="nav-item <?php if($page_title=="Create Alert"){echo "active"; } ?>">
        <a class="nav-link" href="create-alert.php">
            <i class="fa fa-bell" aria-hidden="true"></i>
            <span>Add Alert</span></a>
    </li>
    <li class="nav-item <?php if($page_title=="All Alerts"){echo "active"; } ?>">
        <a class="nav-link" href="list-all-alerts.php">
            <i class="fa fa-bell" aria-hidden="true"></i>
            <span>Alerts</span></a>
    </li>
    <li class="nav-item <?php if($page_title=="Guest Users"){echo "active"; } ?>">
        <a class="nav-link" href="guest-users.php">
            <i class="fas fa-users-cog"></i>
            <span>Guest Users</span></a>
    </li>
    <li class="nav-item <?php if($page_title=="Guest Schedules"){echo "active"; } ?>">
        <a class="nav-link" href="schedules-guest-list.php">
            <i class="fa fa-calendar" aria-hidden="true"></i>
            <span>Guest Schedules</span></a>
    </li>
</ul>
<?php $page_title=""; ?>