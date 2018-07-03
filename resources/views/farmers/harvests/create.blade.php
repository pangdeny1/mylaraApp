@extends("layouts.master")

@section("content")
    <div class="wrapper">
        <div class="page has-sidebar">
            <div class="page-inner">
                <header class="page-title-bar">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">
                                <a href="#">
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Farmers</a>
                            </li>
                        </ol>
                    </nav>
                    <h1 class="page-title"> Record harvest </h1>
                </header>
                <div class="page-section">
                    <div class="row">
                        <div class="col-md-12">

                            <form action="{{ route("farmers.harvests.store", $farmer) }}"
                                  method="post"
                                  class="card border-0"
                            >
                                @csrf
                                <header class="card-header border-bottom-0">
                                    Harvest information
                                </header>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="col-md-4 mb-3">
                                            <label for="expected_amount">Expected harvest</label>
                                            <input type="number"
                                                   name="expected_amount"
                                                   class="form-control {{ $errors->has('expected_amount') ? 'is-invalid' : '' }}"
                                                   id="expected_amount"
                                                   value="{{ old("expected_amount") }}"
                                            >
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="amount_unit">Unit</label>
                                            <select name="amount_unit"
                                                    class="custom-select d-block w-100 {{ $errors->has('amount_unit') ? 'is-invalid' : '' }}"
                                                    id="amount_unit"
                                            >
                                                <option value="t">Tonn</option>
                                                <option value="kg" selected>Kg</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-4 mb-3">
                                            <label for="expected_date">Expected harvest date</label>
                                            <input type="date"
                                                   name="expected_date"
                                                   class="form-control {{ $errors->has('expected_date') ? 'is-invalid' : '' }}"
                                                   id="expected_date"
                                                   value="{{ old("expected_date") }}"
                                            >
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-8 mb-3">
                                            <label for="batch_number">Batch number</label>
                                            <input type="text"
                                                   name="batch_number"
                                                   class="form-control {{ $errors->has('batch_number') ? 'is-invalid' : '' }}"
                                                   id="batch_number"
                                                   value="{{ old("batch_number") }}"
                                            >
                                            @if ($errors->has('batch_number'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('batch_number') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-12 mb-3">
                                            <label for="product_id">Product</label>
                                            <select name="product_id"
                                                    class="form-control {{ $errors->has('product_id') ? 'is-invalid' : '' }}"
                                                    id="product_id"
                                            >
                                                <option value="">Choose...</option>
                                                @foreach(\App\Product::all() as $product)
                                                <option value="{{ $product->id }}" {{ old("product_id") == $product->id ? "selected" : "" }}>
                                                    {{ $product->name }}
                                                </option>
                                                @endforeach
                                            </select>
                                            @if ($errors->has('product_id'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('product_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6 mb-3">
                                            <label for="farm_id">Farm</label>
                                            <select name="farm_id"
                                                    class="form-control {{ $errors->has('farm_id') ? 'is-invalid' : '' }}"
                                                    id="farm_id"
                                            >
                                                <option value="">Choose...</option>
                                                @foreach(\App\Farm::where("farmer_id", $farmer->id)->get() as $farm)
                                                <option value="{{ $farm->id }}" {{ old("farm_id") == $farm->id ? "selected" : "" }}>
                                                    {{ $farm->name }}
                                                </option>
                                                @endforeach
                                            </select>
                                            @if ($errors->has('farm_id'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('farm_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="block_id">Block</label>
                                            <select name="block_id"
                                                    class="form-control {{ $errors->has('block_id') ? 'is-invalid' : '' }}"
                                                    id="block_id"
                                            >
                                                <option value="">Choose...</option>
                                                @foreach(\App\Block::all() as $block)
                                                <option value="{{ $block->id }}" {{ old("block_id") == $block->id ? "selected" : "" }}>
                                                    {{ $block->number }}
                                                </option>
                                                @endforeach
                                            </select>
                                            @if ($errors->has('block_id'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('block_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="description">Description</label>
                                            <textarea class="form-control {{ $errors->has('description') ? 'is-invalid' : '' }}"
                                                      name="description"
                                                      id="description"
                                                      placeholder="Type something...."
                                                      rows="5"
                                            >{{ old("description") }}</textarea>
                                            @if ($errors->has('description'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('description') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <hr class="mb-4">
                                    <button class="btn btn-primary btn-lg btn-block" type="submit">
                                        Save changes
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-sidebar border-left bg-white">
                <header class="sidebar-header d-sm-none">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">
                                <a href="#" onclick="Looper.toggleSidebar()">
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Back</a>
                            </li>
                        </ol>
                    </nav>
                </header>
                <div class="sidebar-section">
                    {{-- <h3 class="section-title"> I'm a sidebar </h3> --}}
                </div>
            </div>
        </div>
    </div>
@endsection