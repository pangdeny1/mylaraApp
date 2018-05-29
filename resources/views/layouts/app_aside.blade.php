<aside class="app-aside">
        <!-- .aside-content -->
        <div class="aside-content">
            <!-- .aside-header -->
            <header class="aside-header d-block d-md-none">
                <!-- .btn-account -->
                <button class="btn-account" type="button" data-toggle="collapse" data-target="#dropdown-aside">
                    <span class="user-avatar user-avatar-lg">
                        <img src="{{ asset("themes/looper/assets/images/avatars/profile.jpg")}}" alt="">
                    </span>
                    <span class="account-icon">
                        <span class="fa fa-caret-down fa-lg"></span>
                    </span>
                            
                    <span class="account-summary">
                        <span class="account-name">Beni Arisandi</span>
                        <span class="account-description">Marketing Manager</span>
                    </span>
                </button>
                <!-- /.btn-account -->
                <!-- .dropdown-aside -->
                <div id="dropdown-aside" class="dropdown-aside collapse">
                    <!-- dropdown-items -->
                    <div class="pb-3">
                        <a class="dropdown-item" href="user-profile.html">
                            <span class="dropdown-icon oi oi-person"></span> Profile</a>
                        <a class="dropdown-item" href="auth-signin-v1.html">
                            <span class="dropdown-icon oi oi-account-logout"></span> Logout</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Help Center</a>
                        <a class="dropdown-item" href="#">Ask Forum</a>
                        <a class="dropdown-item" href="#">Keyboard Shortcuts</a>
                    </div>
                    <!-- /dropdown-items -->
                </div>
                <!-- /.dropdown-aside -->
            </header>
            <!-- /.aside-header -->
            <!-- .aside-menu -->
            <section class="aside-menu has-scrollable">
                <!-- .stacked-menu -->
                <nav id="stacked-menu" class="stacked-menu">

                    <nav class="menu">
                        <div class="menu-item">
                            <a href="{{ route("home") }}" class="menu-link">
                                <span class="fas fa-tachometer-alt text-muted"></span> 
                                <span class="menu-text">Dashboard</span>
                            </a>
                        </div>

                        <div class="menu-header">Purchases</div>
                        <div class="menu-item">
                            <a href="{{ route("purchases.index") }}" class="menu-link">
                                <span class="fas fa-align-left text-muted mr-1"></span>
                                All purchases
                            </a>
                            <a href="{{ route("purchases.index", ["status" => "processed"]) }}" class="menu-link">
                                <span class="fas fa-check-circle text-muted mr-1"></span> 
                                Processed
                            </a>
                            <a href="{{ route("purchases.index", ["status" => "unprocessed"]) }}" class="menu-link">
                                <span class="fas fa-info-circle text-warning mr-1"></span> 
                                Unprocessed
                            </a>
                            <a href="{{ route("purchases.index", ["status" => "rejected"]) }}" class="menu-link">
                                <span class="fas fa-times-circle text-danger mr-1"></span> 
                                Rejected
                            </a>
                            <a href="{{ route("purchases.index", ["status" => "completed"]) }}" class="menu-link mb-2">
                                <span class="fas fa-check-circle text-success mr-1"></span> 
                                Completed
                            </a>
                            
                            <a href="{{ route("purchases.create") }}" class="menu-link">
                                <i class="fas fa-plus-circle"></i> Record a new purchase
                            </a>
                            
                        </div>

                        <div class="menu-header">Farmers</div>
                        <a href="{{ route("farmers.index")}}" class="menu-link mb-2">
                            <i class="fas fa-align-left"></i>
                            <span class="menu-text">Farmers list</span>
                        </a>

                        <div class="menu-header">Reports</div>
                        <div class="menu-item">
                            <a href="{{ route("purchases.reports", ["period" => "daily"]) }}" class="menu-link mb-2">
                                <i class="fas fa-align-left"></i>
                                <span class="menu-text">Purchase History</span>
                            </a>
                            <a href="{{ route("products.reports", ["period" => "daily"]) }}" class="menu-link mb-2">
                                <i class="fas fa-align-left"></i>
                                <span class="menu-text">Product Purchase</span>
                            </a>
                            <a href="#" class="menu-link mb-2">
                                <i class="fas fa-align-left"></i>
                                <span class="menu-text">Company Comparison</span>
                            </a>
                        </div>
                    </nav>
                </nav>
            </section>
        </div>
    </aside>