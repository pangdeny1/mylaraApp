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
                            <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Purchases</a>
                        </li>
                    </ol>
                </nav>
                <h1 class="page-title">Record a new product purchase</h1>
            </header>
            <!-- /.page-title-bar -->
            <!-- .page-section -->
            <div class="page-section">
                <div class="row">
                    <div class="col-md-12">
                        <form action="{{ route("purchases.store") }}"
                                method="post"
                        >
                            @csrf
                            <div class="card border-0">
                                <header class="card-header border-bottom-0">
                                    Basic information
                                </header>
                                <div class="card-body">
                                    <batch-picker inline-template>
                                        <section>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="farmer">Farmer</label>
                                                    <select name="farmer_id"
                                                            id="farmer"
                                                            class="form-control {{ $errors->has("farmer_id") ? "is-invalid" : "" }}"
                                                            v-model="farmer"
                                                    >
                                                        <option value="">-- Select farmer --</option>
                                                        @foreach($farmers as $farmer)
                                                            <option value="{{ $farmer->id }}"
                                                                    {{ old("farmer_id") == $farmer->id ? "selected" : "" }}
                                                                    v-model="farmer"
                                                            >
                                                                {{ $farmer->full_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                    @if($errors->has("farmer_id"))
                                                        <span class="invalid-feedback">
                                                            {{ $errors->first("farmer_id") }}
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="batch_id">Batch</label>
                                                    <select name="batch_id"
                                                            id="batch_id"
                                                            class="form-control {{ $errors->has("batch_id") ? "is-invalid" : "" }}"
                                                            :disabled="! hasBatchNumber"
                                                    >
                                                        <option value="">-- Select batch number --</option>
                                                        <option v-for="batch in batches"
                                                                :key="batch.id"
                                                                :value="batch.id"
                                                        >@{{ batch.number }}</option>

                                                    </select>
                                                    @if($errors->has("batch_id"))
                                                        <span class="invalid-feedback">
                                                            {{ $errors->first("batch_id") }}
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                        </section>
                                    </batch-picker>
                                </div>
                                <hr>
                                <header class="card-header border-bottom-0">
                                    Weight information
                                </header>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-3">
                                            <label for="weight_unit">Unit</label>
                                            <select name="weight_unit"
                                                    id="weight_unit"
                                                    class="form-control {{ $errors->has("weight_unit") ? "is-invalid" : "" }}"
                                            >
                                                <option value="">--Select unit --</option>
                                                <option value="kg" selected>Kilogram</option>
                                                <option value="g">Gram</option>
                                                <option value="mg">Miligram</option>
                                                <option value="lb">Pound</option>
                                                <option value="oz">Ounce</option>
                                                <option value="t">Metric Tonne</option>
                                                <option value="ukt">UK Long Ton</option>
                                                <option value="ust">US short Ton</option>
                                                <option value="st">Stone</option>
                                            </select>
                                            @if($errors->has("weight_unit"))
                                                <span class="invalid-feedback">
                                                    {{ $errors->first("weight_unit") }}
                                                </span>
                                            @endif
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="field_weight">Farm weight</label>
                                            <input type="text"
                                                   name="field_weight"
                                                   id="field_weight"
                                                   class="form-control {{ $errors->has("field_weight") ? "is-invalid" : "" }}"
                                                   value="{{ old("field_weight") }}"
                                            >
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="weight_before">House packing</label>
                                            <input type="number"
                                                   name="weight_before"
                                                   id="weight_before"
                                                   class="form-control {{ $errors->has("weight_before") ? "is-invalid" : "" }}"
                                                   value="{{ old("weight_before") }}"
                                            >
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="weight_after">Graded</label>
                                            <input type="number"
                                                   name="weight_after"
                                                   id="weight_after"
                                                   class="form-control {{ $errors->has("weight_after") ? "is-invalid" : "" }}"
                                                   value="{{ old("weight_after") }}"
                                            >
                                        </div>
                                    </div>


                                    @if($errors->has("field_weight") || $errors->has("weight_after") || $errors->has("weight_before"))
                                        <div class="alert alert-danger">
                                            <p>{{ $errors->first("field_weight") }}</p>
                                            <p>{{ $errors->first("weight_after") }}</p>
                                            <p>{{ $errors->first("weight_before") }}</p>
                                        </div>
                                    @endif

                                </div>
                                <hr>
                                <header class="card-header border-bottom-0">
                                    Price information
                                </header>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="amount">Amount</label>
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    Tsh.
                                                </span>
                                                <input type="text"
                                                       name="amount"
                                                       id="amount"
                                                       class="form-control {{ $errors->has("amount") ? "is-invalid" : "" }}"
                                                >
                                            </div>
                                            @if($errors->has("amount"))
                                                <span class="invalid-feedback">
                                                {{ $errors->first("amount") }}
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="remarks">Remarks</label>
                                            <textarea name="remarks"
                                                      id="remarks"
                                                      class="form-control {{ $errors->has('remarks') ? "is-invalid" : "" }}"
                                                      rows="6"
                                                      placeholder="Type something..."
                                            >{{ old("remarks") }}</textarea>
                                            @if ($errors->has('remarks'))
                                                <span class="invalid-feedback">
                                                <strong>{{ $errors->first('remarks') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                    <hr>
                                    <button class="btn btn-primary btn-lg btn-block" type="submit">
                                        Save changes
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.page-section -->
        </div>
        <!-- /.page-inner -->
        <!-- .page-sidebar -->
        <div class="page-sidebar border-left bg-white">
            <!-- .sidebar-header -->
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
            <!-- /.sidebar-header -->
            <!-- .sidebar-section -->
            <div class="sidebar-section">
                {{-- <h3 class="section-title"> I'm a sidebar </h3> --}}
            </div>
            <!-- /.sidebar-section -->
        </div>
        <!-- /.page-sidebar -->
    </div>
    <!-- /.page -->
</div>
<!-- /.wrapper -->
@endsection