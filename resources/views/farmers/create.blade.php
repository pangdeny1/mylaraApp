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
                                               class="form-control"
                                               value="{{ old("first_name") }}"
                                               placeholder="First name..."
                                        >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="last_name">Last name</label>
                                        <input type="text"
                                               name="last_name"
                                               id="last_name"
                                               class="form-control"
                                               value="{{ old("last_name") }}"
                                               placeholder="Last name..."
                                        >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="phone">Phone number</label>
                                        <input type="text"
                                               name="phone"
                                               id="phone"
                                               class="form-control"
                                               value="{{ old("phone") }}"
                                               placeholder="Phone number..."
                                        >
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
                                        <input type="email" class="form-control" id="email" placeholder="you@example.com">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="birthday">Birthday</label>
                                        <input type="date"
                                               name="birthday"
                                               id="birthday"
                                               class="form-control"
                                               value="{{ old("birthday") }}"
                                               placeholder="Phone number..."
                                        >
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label class="d-block">Gender identity</label>
                                        <div class="custom-control custom-control-inline custom-radio">
                                            <input type="radio" class="custom-control-input" name="gender" id="female">
                                            <label class="custom-control-label" for="female">Female</label>
                                        </div>
                                        <div class="custom-control custom-control-inline custom-radio">
                                            <input type="radio" class="custom-control-input" name="gender" id="male">
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
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="">
                                        <div class="invalid-feedback"> Please enter your shipping address. </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="address2">Address 2
                                            <span class="badge badge-secondary">
                                            <em>Optional</em>
                                        </span>
                                        </label>
                                        <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-5 mb-3">
                                        <label for="country">Country</label>
                                        <select class="custom-select d-block w-100" id="country" required="">
                                            <option value=""> Choose... </option>
                                            <option> United States </option>
                                        </select>
                                        <div class="invalid-feedback"> Please select a valid country. </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="state">State</label>
                                        <select class="custom-select d-block w-100" id="state" required="">
                                            <option value=""> Choose... </option>
                                            <option> California </option>
                                        </select>
                                        <div class="invalid-feedback"> Please provide a valid state. </div>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="zip">Zip</label>
                                        <input type="text" class="form-control" id="zip" required="">
                                        <div class="invalid-feedback"> Zip code required. </div>
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