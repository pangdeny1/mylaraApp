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
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>
                                    Settings
                                </a>
                            </li>
                        </ol>
                    </nav>

                    <div class="d-sm-flex align-items-sm-center">
                        <h1 class="page-title mr-sm-auto mb-0">
                            Groups
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
                            
                            <a href="{{ route("groups.create") }}" class="btn btn-primary">
                                <span class="fas fa-plus mr-1"></span>
                                Add a group
                            </a>
                           
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
                                    <input type="text" class="form-control" placeholder="Search record">
                                </div>
                            </div>
                            <div class="text-muted"> Showing 1 to 10 of 1,000 entries </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Product</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($groups as $group)
                                        <tr>
                                            <td>{{ $group->name }}</td>
                                            <td>
                                                <!-- Button trigger modal -->
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#productModal{{ $group->id }}">
                                                    {{ $group->products->count() }} product
                                                </button>

                                                <!-- Modal -->
                                                <div class="modal fade" id="productModal{{ $group->id }}" tabindex="-1" role="dialog" aria-labelledby="productModalLabel{{ $group->id }}" aria-hidden="true">
                                                    <form action="{{ route("groups.products.store", $group) }}" method="post">
                                                        @csrf
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="productModalLabel{{ $group->id }}">
                                                                        Group product form
                                                                    </h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="form-group">
                                                                        <label>Product</label>
                                                                        <select name="product_id" class="form-control">
                                                                            <option value="">Choose product</option>
                                                                            @foreach(\App\Product::get() as $product)
                                                                            <option value="{{ $product->id }}">
                                                                                {{ $product->name }}
                                                                            </option>
                                                                            @endforeach
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                    
                                                </div>
                                            </td>   
                                            <td class="align-middle text-right">
                                                
                                                <a href="{{ route("groups.edit", $group) }}" class="btn btn-sm btn-secondary">
                                                    <i class="fa fa-pencil-alt"></i>
                                                    <span class="sr-only">Edit</span>
                                                </a>
                                                

                                                
                                                <a href="#" class="btn btn-sm btn-secondary">
                                                    <i class="far fa-trash-alt"></i>
                                                    <span class="sr-only">Remove</span>
                                                </a>
                                                
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            {{ $groups->links() }}
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
@endsection