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
                <h1 class="page-title"> Farmer registration </h1>
            </header>
            <div class="page-section">
                <div class="row">
                    <div class="col-md-12">
                        
                        <form action="{{ route("farmers.store") }}"
                              method="post"
                              class="card border-0"
                        >
                            @csrf
                            <header class="card-header border-bottom-0">
                                Basic information
                            </header>
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="first_name">First name</label>
                                        <input type="text"
                                               name="first_name"
                                               id="first_name"
                                               class="form-control {{ $errors->has('first_name') ? 'is-invalid' : '' }}"
                                               value="{{ old("first_name") }}"
                                               placeholder="First name..."
                                        >
                                        @if ($errors->has('first_name'))
                                            <span class="invalid-feedback">
                                                <strong>{{ $errors->first('first_name') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="last_name">Last name</label>
                                        <input type="text"
                                               name="last_name"
                                               id="last_name"
                                               class="form-control {{ $errors->has('last_name') ? 'is-invalid' : '' }}"
                                               value="{{ old("last_name") }}"
                                               placeholder="Last name..."
                                        >
                                        @if ($errors->has('last_name'))
                                            <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('last_name') }}</strong>
                                                </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="phone">Phone number</label>
                                        <input type="text"
                                               name="phone"
                                               id="phone"
                                               class="form-control {{ $errors->has('phone') ? 'is-invalid' : '' }}"
                                               value="{{ old("phone") }}"
                                               placeholder="Phone number..."
                                        >
                                        @if ($errors->has('phone'))
                                            <span class="invalid-feedback">
                                                    <strong>{{ $errors->first('phone') }}</strong>
                                                </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="email">
                                            Email address
                                            <span class="badge badge-secondary">
                                                <em>Optional</em>
                                            </span>
                                        </label>
                                        <input type="email"
                                               name="email"
                                               class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}"
                                               id="email"
                                               placeholder="you@example.com"
                                               value="{{ old("email") }}"
                                        >
                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label class="d-block">Gender identity</label>
                                        <div class="custom-control custom-control-inline custom-radio">
                                            <input type="radio"
                                                   class="custom-control-input"
                                                   name="gender"
                                                   id="female"
                                                   value="female"
                                                   {{ old("gender") == "female" ? "checked" : "" }}
                                            >
                                            <label class="custom-control-label" for="female">Female</label>
                                        </div>
                                        <div class="custom-control custom-control-inline custom-radio">
                                            <input type="radio"
                                                   class="custom-control-input"
                                                   name="gender"
                                                   id="male"
                                                   value="male"
                                                    {{ old("gender") == "male" ? "checked" : "" }}
                                            >
                                            <label class="custom-control-label" for="male">Male</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="mb-4">
                            <header class="card-header border-bottom-0">
                                Address information
                            </header>
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="street">Street address</label>
                                        <input type="text"
                                               name="street"
                                               class="form-control {{ $errors->has('street') ? 'is-invalid' : '' }}"
                                               id="street"
                                               value="{{ old("street") }}"
                                               placeholder="1234 Main St"
                                        >
                                        @if ($errors->has('street'))
                                            <span class="invalid-feedback">
                                                <strong>{{ $errors->first('street') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="address">
                                            Address 2
                                            <span class="badge badge-secondary">
                                                    <em>Optional</em>
                                                </span>
                                        </label>
                                        <input type="text"
                                               name="address"
                                               class="form-control {{ $errors->has('address') ? 'is-invalid' : '' }}"
                                               id="address"
                                               placeholder="Apartment or suite"
                                        >
                                        @if ($errors->has('address'))
                                            <span class="invalid-feedback">
                                                <strong>{{ $errors->first('address') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-5 mb-3">
                                        <label for="country">Country</label>
                                        <select name="country"
                                                class="custom-select d-block w-100"
                                                id="country"
                                        >
                                            <option value="Tanzania">Tanzania</option>
                                        </select>
                                        <div class="invalid-feedback"> Please select a valid country. </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
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
                                    <div class="col-md-3 mb-3">
                                        <label for="postal_code">Zip</label>
                                        <input type="text"
                                               name="postal_code"
                                               class="form-control {{ $errors->has('postal_code') ? 'is-invalid' : '' }}"
                                               id="postal_code"
                                               value="{{ old("postal_code") }}"
                                        >
                                        @if ($errors->has('postal_code'))
                                            <span class="invalid-feedback">
                                                <strong>{{ $errors->first('postal_code') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <hr class="mb-4">
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
                                        <label for="block">Block</label>
                                        <select name="block_id"
                                                class="form-control {{ $errors->has('block_id') ? 'is-invalid' : '' }}"
                                                id="block"
                                        >
                                            <option value=""> Choose... </option>
                                            @foreach(\App\Block::all() as $block)
                                                <option value="{{ $block->id }}" {{ old("block_id") == $block->id ? "selected" : "" }}>
                                                    {{ $block->name }}
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
                                                    <div class="tile tile-circle" :class="selectedCrop.color">
                                                        @{{ selectedCrop.placeholder }}
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
                                                    <button @click.prevent="removeRole(selectedCrop.id)" class="btn btn-sm btn-light">
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
                                    </div>
                                </div>
                            </div>
                            <hr class="mb-4">
                            <header class="card-header border-bottom-0">
                                Harvest information
                            </header>
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="col-md-4 mb-3">
                                        <label for="volume">Expected harvest</label>
                                        <input type="number"
                                               name="volume"
                                               class="form-control {{ $errors->has('volume') ? 'is-invalid' : '' }}"
                                               id="volume"
                                        >
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="volume_unit">Unit</label>
                                        <select name="volume_unit"
                                                class="custom-select d-block w-100 {{ $errors->has('volume_unit') ? 'is-invalid' : '' }}"
                                                id="block"
                                        >
                                            <option value="t">Tonn</option>
                                            <option value="kg" selected>Kg</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="harvest_description">Description</label>
                                        <textarea class="form-control {{ $errors->has('harvest_description') ? 'is-invalid' : '' }}"
                                                  name="harvest_description"
                                                  id="harvest_description"
                                                  placeholder="Type something...."
                                                  rows="5"
                                        ></textarea>
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