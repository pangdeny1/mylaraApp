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
                                @can("create", \App\Purchase::class)
                                <a href="{{ route("purchases.create") }}" class="btn btn-primary">
                                    <span class="fas fa-plus mr-1"></span>
                                    Record a new purchase
                                </a>
                                @endcan
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
                                                <th class="text-left"  nowrap>Farmer</th>
                                                <th class="text-left"  nowrap>Product</th>
                                                <th class="text-left"  nowrap>Batch number</th>
                                                <th class="text-left"  nowrap>Block ID</th>
                                                <th class="text-left"  nowrap>Harvest date</th>
                                                <th class="text-right" nowrap>Farm weight</th>
                                                <th class="text-right" nowrap>Pack house weight</th>
                                                <th class="text-right" nowrap>Graded weight</th>
                                                <th class="text-right" nowrap>Reject weight</th>
                                                <th class="text-right" nowrap>Amount</th>
                                                <th class="text-left"  nowrap>Status</th>
                                                <th class="text-left"  nowrap style="width:100px; min-width:100px;">&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($purchases as $purchase)
                                                <tr>
                                                    <td nowrap>
                                                        <a href="{{ route("farmers.show", $purchase->farmer) }}" class="user-avatar mr-1">
                                                            <img class="img-fluid"
                                                                 src="{{ Avatar::create($purchase->farmer->full_name)->toBase64() }}"
                                                                 alt="{{ $purchase->farmer->full_name }}"
                                                            >
                                                        </a>
                                                        <a href="{{ route("farmers.show", $purchase->farmer) }}">
                                                            {{ $purchase->farmer->full_name }}
                                                        </a>
                                                    </td>
                                                    <td>{{ $purchase->product->name }}</td>
                                                    <td>{{ $purchase->batch->number }}</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td class="text-right">
                                                        {{ $purchase->weight()->field_in_kg }}
                                                    </td>
                                                    <td class="text-right">
                                                        {{ $purchase->weight()->before_in_kg }}
                                                    </td>
                                                    <td class="text-right">
                                                        @include("purchases.partials.weight_modal")
                                                    </td>
                                                    <td class="text-right">
                                                        {{ $purchase->weight()->loss_in_kg }}
                                                    </td>
                                                    <td class="text-right" nowrap>
                                                        {{ $purchase->price()->amount }}
                                                    </td>
                                                    <td class="text-capitalize" nowrap>
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