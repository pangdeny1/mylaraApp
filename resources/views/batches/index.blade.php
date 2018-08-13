@extends("layouts.master")

@section("content")
    <div class="wrapper">
        <div class="page">
            <div class="page-inner">
                <header class="page-title-bar">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">
                                <a href="#">
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Settings
                                </a>
                            </li>
                        </ol>
                    </nav>

                    <div class="d-sm-flex align-items-sm-center">
                        <h1 class="page-title mr-sm-auto mb-0">
                            Batches
                        </h1>
                        <div class="btn-toolbar">
                            <button type="button" class="btn btn-light">
                                <i class="oi oi-data-transfer-download"></i>
                                <span class="ml-1">Export</span>
                            </button>
                            <button type="button" class="btn btn-light">
                                <i class="oi oi-data-transfer-upload"></i>
                                <span class="ml-1">Import</span>
                            </button>
                            @can("create", \App\Batch::class)
                            <a href="{{ route("batches.create") }}" class="btn btn-primary">
                                <span class="fas fa-plus mr-1"></span>
                                Add a new batch
                            </a>
                            @endcan
                        </div>
                    </div>
                </header>
                <div class="page-section">
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
                                <form action="">
                                    <input type="text" name="q" class="form-control" placeholder="Search record...">
                                </form>
                            </div>
                        </div>

                        <div class="text-muted my-3"> Showing {{ $batches->firstItem() }} to {{ $batches->lastItem() }} of  {{ $batches->total() }} entries </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th nowrap>Number</th>
                                            <th class="text-right" nowrap>Max #</th>
                                            <th nowrap>Valid from</th>
                                            <th nowrap>Valid till</th>
                                            <th nowrap>Status</th>
                                            <th class="text-right" nowrap>Members</th>
                                            <th nowrap></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($batches as $batch)
                                        <tr>
                                            <td class="text-left"  nowrap>
                                                {{ $batch->number }}
                                            </td>
                                            <td class="text-right" nowrap>
                                                {{ $batch->max_count }}
                                            </td>
                                            <td class="text-left" nowrap>
                                                {{ $batch->valid_from->toFormattedDateString() }}
                                            </td>
                                            <td class="text-left" nowrap>
                                                {{ $batch->valid_till->toFormattedDateString() }}
                                            </td>
                                            <td class="text-left" nowrap>
                                                {{ $batch->status }}
                                            </td>
                                            <td class="text-right" nowrap>
                                                {{ $batch->farmers->count() }}
                                            </td>
                                            <td class="align-middle text-right" nowrap>
                                                @can("edit", $batch)
                                                <a href="{{ route("batches.edit", $batch) }}" class="btn btn-sm btn-secondary">
                                                    <i class="fa fa-pencil-alt"></i>
                                                    <span class="sr-only">Edit</span>
                                                </a>
                                                @endcan

                                                @can("delete", $batch)
                                                <a href="#" class="btn btn-sm btn-secondary">
                                                    <i class="far fa-trash-alt"></i>
                                                    <span class="sr-only">Remove</span>
                                                </a>
                                                @endcan
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            {{ $batches->links() }}
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
@endsection