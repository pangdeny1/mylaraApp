@extends("layouts.master")

@section("content")
    <div class="wrapper">
        <div class="page">
            <div class="sidebar-backdrop"></div>
            <!-- .page-cover -->
            @include("farmers._page_cover")

            <!-- .page-navs -->
            @include("farmers._page_nav")

            <div class="page-inner">
                <!-- .page-title-bar -->
                <header class="page-title-bar">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">
                                <a href="{{ route("farmers.show", $farmer) }}">
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>
                                    {{ $farmer->full_name  }}
                                </a>
                            </li>
                        </ol>
                    </nav>
                    <h1 class="page-title mr-sm-auto"> Harvests
                        <small class="badge">{{ $farmer->harvests->count() }} Totals</small>
                    </h1>
                </header>

                <!-- .page-section -->
                <div class="page-section">
                    <!-- .masonry-layout -->
                    <div class="masonry-layout mb-4" style="position: relative; height: 800px;">
                        <div class="masonry-item col-lg-6" >
                            <section class="card card-fluid" style="min-height: 418px;">
                                <a href="{{ route("farmers.harvests.create", $farmer) }}" class="card-body">
                                    <i class="fas fa-plus-circle"></i>
                                </a>
                            </section>
                        </div>
                        @foreach($farmer->harvests as $harvest)
                        <div class="masonry-item col-lg-6">
                            <section class="card card-fluid">
                                <div class="card-body">
                                    <div class="media align-items-center mb-3">
                                        <a href="#" class="user-avatar user-avatar-lg mr-3">
                                            <img src="{{ Avatar::create($harvest->product->name)->toBase64() }}" />
                                        </a>
                                        <div class="media-body">
                                            <h3 class="card-title">
                                                <a href="#">{{ $harvest->product->name }}</a>
                                            </h3>
                                            <h6 class="card-subtitle text-muted"> Harvest </h6>
                                        </div>
                                        <a href="#"
                                           class="btn btn-reset text-muted"
                                           data-toggle="tooltip"
                                           title=""
                                           data-original-title="Chat with teams">
                                            <i class="oi oi-chat"></i>
                                        </a>
                                    </div>

                                    <p>{{ $harvest->description }}</p>

                                    <table class="table">
                                        <tr>
                                            <td>
                                                <span class="list-icon">
                                                    <i class="fas fa-map-signs"></i>
                                                </span> Farm
                                            </td>
                                            <td>Usa Liver, {{ $harvest->farm->name }}</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="list-icon">
                                                    <i class="fas fa-tree"></i>
                                                </span> Product
                                            </td>
                                            <td>{{ $harvest->product->name }}</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="list-icon">
                                                    <i class="far fa-calendar-check"></i>
                                                </span> Expected date
                                            </td>
                                            <td>{{ $harvest->expected_date->toFormattedDateString() }}</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="list-icon">
                                                    <i class="fas fa-filter"></i>
                                                </span> Expected volume
                                            </td>
                                            <td>{{ $harvest->volume }}</td>
                                        </tr>
                                    </table>
                                </div>
                            </section>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection