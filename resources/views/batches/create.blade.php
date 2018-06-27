@extends("layouts.master")

@section("content")
    <div class="wrapper">
        <div class="page has-sidebar">
            <div class="sidebar-backdrop"></div>
            <div class="page-inner">
                <header class="page-title-bar">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">
                                <a href="#">
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i> Settings
                                </a>
                            </li>
                        </ol>
                    </nav>
                    <h1 class="page-title"> New batch </h1>
                </header>

                <div class="page-section">
                    <div class="section-block">
                        <div class="d-xl-none">
                            <button class="btn btn-danger btn-floated" type="button" data-toggle="sidebar">
                                <i class="fa fa-th-list"></i>
                            </button>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <form action="{{ route("batches.store") }}"
                                  method="post"
                                  class="card"
                            >
                                @csrf
                                <header class="card-header border-bottom-0">
                                    Create a new batch
                                </header>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="number">Number</label>
                                            <input type="text"
                                                   name="number"
                                                   id="number"
                                                   class="form-control {{ $errors->has('number') ? 'is-invalid' : '' }}"
                                                   value="{{ old("number", \App\Batch::number()) }}"
                                                   placeholder="JKTR-182"
                                            >
                                            @if ($errors->has('number'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('number') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="max_count">Maximum number of farmers</label>
                                            <input type="number"
                                                   name="max_count"
                                                   id="max_count"
                                                   class="form-control {{ $errors->has('max_count') ? 'is-invalid' : '' }}"
                                                   value="{{ old("max_count", 10) }}"
                                            >
                                            @if ($errors->has('max_count'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('max_count') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="valid_from">Valid from</label>
                                            <input type="date"
                                                   name="valid_from"
                                                   id="valid_from"
                                                   class="form-control {{ $errors->has('valid_from') ? 'is-invalid' : '' }}"
                                                   value="{{ old("valid_from") }}"
                                            >
                                            @if ($errors->has('valid_from'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('valid_from') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="valid_till">Valid till</label>
                                            <input type="date"
                                                   name="valid_till"
                                                   id="valid_till"
                                                   class="form-control {{ $errors->has('valid_till') ? 'is-invalid' : '' }}"
                                                   value="{{ old("valid_till") }}"
                                            >
                                            @if ($errors->has('valid_till'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('valid_till') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <farmers-picker inline-template>
                                        <div>
                                            <div class="form-row mb-2">
                                                <div class="form-group col-md-12">
                                                    <label for="roles">Farmers</label>
                                                    <select id="roles"
                                                            class="form-control {{ $errors->has('farmers') ? 'is-invalid' : '' }}"
                                                            v-model="newFarmer"
                                                            @change.prevent="addFarmer"
                                                    >
                                                        <option value="">Choose...</option>
                                                        <option v-for="farmer in farmers"
                                                                :value="farmer.id"
                                                                v-text="farmer.full_name"
                                                        >
                                                        </option>
                                                    </select>
                                                    @if ($errors->has('farmers'))
                                                        <span class="invalid-feedback">
                                                            <strong>{{ $errors->first('farmers') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="text-muted mb-2" v-if="selectedFarmers.length">
                                                @{{  selectedFarmers.length }} out of 10 are selected
                                            </div>

                                            <div class="list-group list-group-flush list-group-divider mb-4" v-if="selectedFarmers.length">
                                                <div class="list-group-item" v-for="selectedFarmer in selectedFarmers">
                                                    <div class="list-group-item-figure">
                                                        <div class="user-avatar">
                                                            <img :src="selectedFarmer.avatar.encoded" :alt="selectedFarmer.full_name">
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="farmers[]" :value="selectedFarmer.id">
                                                    <div class="list-group-item-body">
                                                        <h4 class="list-group-item-title">
                                                            <a href="#" v-text="selectedFarmer.full_name"></a>
                                                        </h4>
                                                        <p class="list-group-item-text" v-text="selectedFarmer.phone"></p>
                                                    </div>
                                                    <div class="list-group-item-figure">
                                                        <button @click.prevent="removeFarmer(selectedFarmer.id)" class="btn btn-sm btn-light">
                                                            <i class="far fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </div >
                                            </div>
                                        </div>
                                    </farmers-picker>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="description">Description</label>
                                            <textarea name="description"
                                                      id="description"
                                                      class="form-control {{ $errors->has('description') ? 'is-invalid' : '' }}"
                                                      rows="6"
                                                      placeholder="Type something..."
                                            >{{ old("description") }}</textarea>
                                            @if ($errors->has('description'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('description') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <hr>
                                    <button class="btn btn-block btn-primary">Save changes</button>
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
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Back
                                </a>
                            </li>
                        </ol>
                    </nav>
                </header>
                <div class="sidebar-section">
                    {{--<h3 class="section-title"> I'm a sidebar </h3>--}}
                </div>
            </div>
        </div>
    </div>
@endsection