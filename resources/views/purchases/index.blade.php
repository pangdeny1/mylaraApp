@extends("layouts.master")

@section("content")
    @if($purchases->count())
        <div class="wrapper">
            <div class="page">
                <div class="page-inner">
                    <header class="page-title-bar">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item active">
                                    <a href="#">
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Purchases</a>
                                </li>
                            </ol>
                        </nav>

                        <div class="d-sm-flex align-items-sm-center">
                            <h1 class="page-title mr-sm-auto mb-0"> Purchases </h1>
                            <div class="btn-toolbar">
                                <button type="button" class="btn btn-light">
                                    <i class="oi oi-data-transfer-download"></i>
                                    <span class="ml-1">Export</span>
                                </button>
                                <button type="button" class="btn btn-light">
                                    <i class="oi oi-data-transfer-upload"></i>
                                    <span class="ml-1">Import</span>
                                </button>
                                <a href="{{ route("purchases.create") }}" class="btn btn-primary">
                                    <span class="fas fa-plus mr-1"></span>
                                    Record a new purchase
                                </a>
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
                                <div class="table-responsive" style="min-height: 500px;">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Farmer</th>
                                                <th>Product</th>
                                                <th class="text-right">Weight before</th>
                                                <th class="text-right">Weight after</th>
                                                <th class="text-right">Amount</th>
                                                <th>Status</th>
                                                <th style="width:100px; min-width:100px;"> &nbsp; </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($purchases as $purchase)
                                                <tr>
                                                    <td>{{ $purchase->farmer->full_name }}</td>
                                                    <td>{{ $purchase->product->name }}</td>
                                                    <td class="text-right">
                                                        {{ $purchase->weight_before_processing }}
                                                        {{ $purchase->weight_unit }}
                                                    </td>
                                                    <td class="text-right">
                                                        @include("purchases.partials.weight_modal")
                                                    </td>
                                                    <td class="text-right">
                                                        {{ number_format($purchase->amount, 2) }}
                                                    </td>
                                                    <td class="text-capitalize">
                                                        @include("purchases.partials.statuses.$purchase->status")
                                                    </td>
                                                    <td>
                                                        @include("purchases.partials.actions")
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                <!-- .pagination -->
                                {{ $purchases->links() }}
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