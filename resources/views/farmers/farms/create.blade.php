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
                    <h1 class="page-title"> Add a new farmland </h1>
                </header>
                <div class="page-section">
                    <div class="row">
                        <div class="col-md-12">

                            <form action="{{ route("farmers.farms.store", $farmer) }}"
                                  method="post"
                                  class="card border-0"
                            >
                                @csrf
                                <header class="card-header border-bottom-0">
                                    Farm information
                                </header>
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="col-md-2 mb-3">
                                            <label for="size">Size</label>
                                            <input type="number"
                                                   name="size"
                                                   class="form-control {{ $errors->has('size') ? 'is-invalid' : '' }}"
                                                   id="size"
                                                   value="{{ old("size") }}"
                                            >
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="size_unit">Unit</label>
                                            <select name="size_unit"
                                                    class="custom-select d-block w-100 {{ $errors->has('size_unit') ? 'is-invalid' : '' }}"
                                                    id="size_unit"
                                            >
                                                <option value="acre">Acre</option>
                                            </select>
                                            @if ($errors->has('size_unit'))
                                                <span class="invalid-feedback">
                                                <strong>{{ $errors->first('size_unit') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6 mb-3">
                                            <label for="country">Country</label>
                                            <select name="country"
                                                    class="form-control"
                                                    id="country"
                                            >
                                                <option value="Tanzania">Tanzania</option>
                                            </select>
                                            <div class="invalid-feedback"> Please select a valid country. </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="state">State</label>
                                            <select name="state"
                                                    class="form-control d-block w-100 {{ $errors->has('state') ? 'is-invalid' : '' }}"
                                                    id="state"
                                                    required=""
                                            >
                                                <option value=""> Choose... </option>
                                                @foreach($states as $key => $state)
                                                    <option name="{{ $state["name"] }}" {{ old("state") === $state["name"] ? "selected" : "" }}>
                                                        {{ $state["name"] }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <div class="invalid-feedback"> Please provide a valid state. </div>
                                        </div>
                                    </div>
                                    <crops-picker inline-template>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label for="crops">Crops</label>
                                                <select id="crops"
                                                        class="form-control {{ $errors->has('crops') ? 'is-invalid' : '' }}"
                                                        v-model="newCrop"
                                                        @change.prevent="addCrop"
                                                >
                                                    <option value="">Choose...</option>
                                                    <option v-for="crop in crops"
                                                            :value="crop.id"
                                                            v-text="crop.name"
                                                    >
                                                    </option>
                                                </select>
                                                @if ($errors->has('crops'))
                                                    <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('crops') }}</strong>
                                                </span>
                                                @endif
                                            </div>

                                            <div class="list-group list-group-flush list-group-divider mb-4" v-if="selectedCrops.length">
                                                <div class="list-group-item" v-for="selectedCrop in selectedCrops">
                                                    <div class="list-group-item-figure">
                                                        <div class="user-avatar" :class="selectedCrop.color">
                                                            <img :src="selectedCrop.avatar.encoded" :alt="selectedCrop.name">
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="crops[]" :value="selectedCrop.id">
                                                    <div class="list-group-item-body">
                                                        <h4 class="list-group-item-title">
                                                            <a href="#" v-text="selectedCrop.name"></a>
                                                        </h4>
                                                        <p class="list-group-item-text" v-text="selectedCrop.description"></p>
                                                    </div>
                                                    <div class="list-group-item-figure">
                                                        <button @click.prevent="removeCrop(selectedCrop.id)" class="btn btn-sm btn-light">
                                                            <i class="far fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </div >
                                            </div>
                                        </div>
                                    </crops-picker>
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
                                </div>
                                <hr>
                                <div class="card-body">
                                    <header>
                                        <div class="card-title">Blocks Information</div>
                                    </header>
                                    <div class="form-row">
                                        <div class="col-md-6 mb-3">
                                            <label for="block_number">Number</label>
                                            <input name="block_number"
                                                   class="form-control {{ $errors->has('block_number') ? 'is-invalid' : '' }}"
                                                   id="block_number"
                                                   value="{{ old("block_number") }}"
                                            >
                                            @if ($errors->has('block_number'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('block_number') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-12 mb-3">
                                            <label for="block_description">Description</label>
                                            <textarea name="block_description"
                                                      class="form-control {{ $errors->has('block_description') ? 'is-invalid' : '' }}"
                                                      id="block_description"
                                                      rows="4"
                                            >{{ old("block_description") }}</textarea>
                                            @if ($errors->has('block_description'))
                                                <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('block_description') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <hr class="mb-4">
                                    <div class="form-row">
                                        <button class="btn btn-primary btn-lg btn-block" type="submit">
                                            Save changes
                                        </button>
                                    </div>
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