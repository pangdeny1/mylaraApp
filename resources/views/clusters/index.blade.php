@extends("layouts.master")

@section("content")
    @if($clusters->count())
        <div class="wrapper">
            <div class="page">
                <div class="page-inner">
                    <header class="page-title-bar">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item active">
                                    <a href="#">
                                        <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Clusters</a>
                                </li>
                            </ol>
                        </nav>

                        <div class="d-sm-flex align-items-sm-center">
                            <h1 class="page-title mr-sm-auto mb-0"> Clusters </h1>
                            <div class="btn-toolbar">
                                <button type="button" class="btn btn-light">
                                    <i class="oi oi-data-transfer-download"></i>
                                    <span class="ml-1">Export</span>
                                </button>
                                <button type="button" class="btn btn-light">
                                    <i class="oi oi-data-transfer-upload"></i>
                                    <span class="ml-1">Import</span>
                                </button>
                            </div>
                        </div>
                    </header>
                    <div class="page-section">
                        @if (session('status'))
                            <div class="alert alert-success alert-dismissible fade show has-icon">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <div class="alert-icon">
                                    <i class="fas fa-info-circle"></i>
                                </div>
                                <strong>Well done!</strong> {{ session('status') }}
                            </div>
                        @endif

                        <section class="card card-fluid">
                            <header class="card-header">
                                <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link {{ request()->query("status") ? "" : "active" }}"
                                           href="{{ route("purchases.index") }}"
                                        >
                                            All
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{ request()->query("status") === "processed" ? "active" : "" }}"
                                           href="{{ route("purchases.index", ["status" => "processed"]) }}"
                                        >
                                            Processed
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{ request()->query("status") === "unprocessed" ? "active" : "" }}"
                                           href="{{ route("purchases.index", ["status" => "unprocessed"]) }}"
                                        >
                                            Unprocessed
                                        </a>
                                    </li>
                                    <li class="nav-item ">
                                        <a class="nav-link {{ request()->query("status") === "rejected" ? "active" : "" }}"
                                           href="{{ route("purchases.index", ["status" => "rejected"]) }}">
                                            Rejected
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{ request()->query("status") === "completed" ? "active" : "" }}"
                                           href="{{ route("purchases.index", ["status" => "completed"]) }}">
                                            Completed
                                        </a>
                                    </li>
                                </ul>
                            </header>

                            <div class="card-body">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <span class="oi oi-magnifying-glass"></span>
                                        </span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Search record">
                                    </div>
                                </div>

                                <!-- .table-responsive -->
                                <div class="text-muted"> Showing 1 to 10 of 1,000 entries </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th class="text-left"  nowrap>Number</th>
                                            <th class="text-left"  nowrap>Max</th>
                                            <th class="text-left"  nowrap>Status</th>
                                            <th class="text-left"  nowrap>Members</th>
                                            <th class="text-left"  nowrap>Purchases</th>
                                            <th class="text-left"  nowrap>Harvests</th>
                                            <th nowrap="">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($clusters as $cluster)
                                            <tr>
                                                <td nowrap>
                                                    <a href="{{ route("batches.show", $cluster) }}" class="user-avatar mr-1">
                                                        <img class="img-fluid"
                                                             src="{{ Avatar::create($cluster->number)->toBase64() }}"
                                                             alt="{{ $cluster->number }}"
                                                        >
                                                    </a>
                                                    <a href="{{ route("batches.show", $cluster) }}">
                                                        {{ $cluster->number }}
                                                    </a>
                                                </td>
                                                <td>{{ $cluster->max_count }}</td>
                                                <td>{{ $cluster->status }}</td>
                                                <td>
                                                    @include("clusters._member_modal")
                                                </td>
                                                <td>
                                                    @include("clusters._purchases_modal")
                                                </td>
                                                <td>{{ $cluster->harvests->count() }}</td>
                                                <td nowrap="">
                                                    @if($cluster->max_count > $cluster->farmers->count())
                                                        @if(\App\Farmer::query()->whereNotIn("id", $cluster->farmers->pluck("id"))->exists())
                                                            @include("clusters._farmers_modal")
                                                        @endif
                                                    @else
                                                        <button type="button" class="btn btn-sm btn-primary">
                                                            Batch is full
                                                        </button>
                                                    @endif

                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                <!-- .pagination -->
                                {{ $clusters->links() }}
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    @else
        <div class="wrapper">
            <!-- .empty-state -->
            <section id="notfound-state" class="empty-state">
                <!-- .empty-state-container -->
                <div class="empty-state-container">
                    <div class="state-figure">
                        <img class="img-fluid"
                             src="{{ asset("themes/looper/assets/images/illustration/img-7.png") }}"
                             alt=""
                             style="max-width: 300px">
                    </div>
                    <h3 class="state-header"> No Content, Yet. </h3>
                    <p class="state-description lead text-muted"> Use the button below to add your awesomething, aperiam ex veniam suscipit porro ab saepe nobis odio. </p>
                    <div class="state-action">
                        <a href="{{ route("farmers.create") }}" class="btn btn-primary">Record new a purchase</a>
                    </div>
                </div>
                <!-- /.empty-state-container -->
            </section>
            <!-- /.empty-state -->
        </div>
    @endif
@endsection