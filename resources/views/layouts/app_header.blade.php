<header class="app-header">
    <div class="top-bar">
        <div class="top-bar-brand">
            <a href="{{ route("home") }}">
                <img src="{{ asset("themes/looper/assets/images/brand-inverse.png") }}" height="32" alt="">
            </a>
        </div>
        <div class="top-bar-list">
            <div class="top-bar-item px-2 d-md-none d-lg-none d-xl-none">
                <button class="hamburger hamburger-squeeze"
                        type="button"
                        data-toggle="aside"
                        aria-label="Menu"
                        aria-controls="navigation"
                >
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </button>
            </div>

            <div class="top-bar-item top-bar-item-full"></div>

            <div class="top-bar-item top-bar-item-right px-0 d-none d-sm-flex">
                <ul class="header-nav nav">
                    <li class="nav-item dropdown header-nav-dropdown has-notified">
                        <a class="nav-link"
                           href="#"
                           data-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false"
                        >
                            <span class="oi oi-envelope-open"></span>
                        </a>
                        <div class="dropdown-arrow"></div>
                        <div class="dropdown-menu dropdown-menu-rich dropdown-menu-right">
                            <h6 class="dropdown-header stop-propagation">
                                <span>Messages</span>
                                <a href="#">Mark all as read</a>
                            </h6>
                            <div class="dropdown-scroll has-scrollable">
                                <a href="#" class="dropdown-item unread">
                                    <div class="user-avatar">
                                        <img src="{{ asset("themes/looper/assets/images/avatars/team1.jpg") }}" alt="">
                                    </div>
                                    <div class="dropdown-item-body">
                                        <p class="subject"> Stilearning </p>
                                        <p class="text text-truncate"> Invitation: Joe's Dinner @ Fri Aug 22 </p>
                                        <span class="date">2 hours ago</span>
                                    </div>
                                </a>
                                <a href="#" class="dropdown-item">
                                    <div class="user-avatar">
                                        <img src="{{ asset("themes/looper/assets/images/avatars/team3.png") }}" alt=""> </div>
                                    <div class="dropdown-item-body">
                                        <p class="subject"> Openlane </p>
                                        <p class="text text-truncate"> Final reminder: Upgrade to Pro </p>
                                        <span class="date">23 hours ago</span>
                                    </div>
                                </a>
                                <a href="#" class="dropdown-item">
                                    <div class="tile tile-circle bg-green"> GZ </div>
                                    <div class="dropdown-item-body">
                                        <p class="subject"> Gogo Zoom </p>
                                        <p class="text text-truncate"> Live healthy with this wireless sensor. </p>
                                        <span class="date">1 day ago</span>
                                    </div>
                                </a>
                                <a href="#" class="dropdown-item">
                                    <div class="tile tile-circle bg-teal"> GD </div>
                                    <div class="dropdown-item-body">
                                        <p class="subject"> Gold Dex </p>
                                        <p class="text text-truncate"> Invitation: Design Review @ Mon Jul 7 </p>
                                        <span class="date">1 day ago</span>
                                    </div>
                                </a>
                                <a href="#" class="dropdown-item">
                                    <div class="user-avatar">
                                        <img src="{{ asset("themes/looper/assets/images/avatars/team2.png") }}" alt=""> </div>
                                    <div class="dropdown-item-body">
                                        <p class="subject"> Creative Division </p>
                                        <p class="text text-truncate"> Need some feedback on this please </p>
                                        <span class="date">2 days ago</span>
                                    </div>
                                </a>
                                <a href="#" class="dropdown-item">
                                    <div class="tile tile-circle bg-pink"> LD </div>
                                    <div class="dropdown-item-body">
                                        <p class="subject"> Lab Drill </p>
                                        <p class="text text-truncate"> Our UX exercise is ready </p>
                                        <span class="date">6 days ago</span>
                                    </div>
                                </a>
                            </div>
                            <a href="#" class="dropdown-footer">All messages
                                <i class="fa fa-fw fa-long-arrow-alt-right"></i>
                            </a>
                        </div>
                    </li>

                    <li class="nav-item dropdown header-nav-dropdown">
                        <a class="nav-link"
                           href="#"
                           data-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false"
                        >
                            <i class="fas fa-cog"></i>
                        </a>
                        <div class="dropdown-arrow"></div>
                        <div class="dropdown-menu">
                            <h6 class="dropdown-header">Products</h6>
                            <a href="{{ route("products.index") }}" class="dropdown-item ">
                                Products list
                            </a>
                            <a href="{{ route("products.create") }}" class="dropdown-item ">
                                <i class="fas fa-plus-circle"></i>
                                Add a new
                            </a>
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header">Product categories</h6>
                            <a href="{{ route("product_categories.index") }}" class="dropdown-item ">
                                Categories list
                            </a>
                            <a href="{{ route("product_categories.create") }}" class="dropdown-item ">
                                <i class="fas fa-plus-circle"></i>
                                Add a new
                            </a>
                        </div>
                    </li>
                </ul>
                <div class="dropdown">
                    <button class="btn-account d-none d-md-flex"
                            type="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                    >
                        <span class="user-avatar">
                            <img src="{{ asset("themes/looper/assets/images/avatars/profile.jpg") }}" alt="">
                        </span>
                        <span class="account-summary pr-lg-4 d-none d-lg-block">
                            <span class="account-name">{{ auth()->user()->name }}</span>
                            <span class="account-description">Marketing Manager</span>
                        </span>
                    </button>
                    <div class="dropdown-arrow dropdown-arrow-left"></div>
                    <div class="dropdown-menu">
                        <h6 class="dropdown-header d-none d-md-block d-lg-none">
                            {{ auth()->user()->name }}
                        </h6>
                        <a class="dropdown-item" href="user-profile.html">
                            <span class="dropdown-icon oi oi-person"></span> Profile</a>
                        <a class="dropdown-item" href="auth-signin-v1.html">
                            <span class="dropdown-icon oi oi-account-logout"></span> Logout</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Help Center</a>
                        <a class="dropdown-item" href="#">Ask Forum</a>
                        <a class="dropdown-item" href="#">Keyboard Shortcuts</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>