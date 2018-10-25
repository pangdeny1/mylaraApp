@extends('layouts.master')

@section('content')
      <div class="page-section">
                <!-- .section-deck -->
                <div class="section-deck">
                  <!-- .card -->
                  <section class="card card-fluid">
                    <!-- .card-body -->
                    <div class="card-body">
                      <h4 class="card-title"> Flatpickr </h4>
                      <h6 class="card-subtitle mb-4"> Lightweight and powerful datetimepicker with no dependencies </h6>
                      <!-- form -->
                      <form>
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr01">Basic</label>
                          <input id="flatpickr01" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr02">DateTime</label>
                          <input id="flatpickr02" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr03">Human-friendly Dates</label>
                          <input id="flatpickr03" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr04">minDate and maxDate</label>
                          <input id="flatpickr04" type="text" class="form-control">
                          <small class="form-text text-muted">14 days from now</small>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr05">Disabling dates</label>
                          <input id="flatpickr05" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr06">Selecting multiple dates</label>
                          <input id="flatpickr06" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr07">Range Calendar</label>
                          <input id="flatpickr07" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr08">Time Picker</label>
                          <input id="flatpickr08" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr-wrap">Wrap element</label>
                          <div class="input-group input-group-alt flatpickr" id="flatpickr9">
                            <input id="flatpickr-wrap" type="text" class="form-control" data-input="">
                            <div class="input-group-append">
                              <button type="button" class="btn btn-secondary" data-toggle="">
                                <i class="far fa-calendar"></i>
                              </button>
                              <button type="button" class="btn btn-secondary" data-clear="">
                                <i class="fa fa-times"></i>
                              </button>
                            </div>
                          </div>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label" for="flatpickr10">Inline Calendar</label>
                          <input id="flatpickr10" type="hidden" class="form-control d-none"> </div>
                        <!-- /.form-group -->
                      </form>
                      <!-- /form -->
                    </div>
                    <!-- /.card-body -->
                  </section>
                  <!-- /.card -->
                  <!-- .card -->
                  <section class="card card-fluid">
                    <!-- .card-body -->
                    <div class="card-body">
                      <h4 class="card-title"> Colorpicker </h4>
                      <h6 class="card-subtitle mb-4"> Simple and customizable colorpicker. </h6>
                      <!-- form -->
                      <form>
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="colorpicker1" class="control-label">Simple input field</label>
                          <input id="colorpicker1" type="text" class="form-control" value="#9474a9"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="inputColorpicker2" class="control-label">As a component</label>
                          <div id="colorpicker2" class="input-group input-group-alt">
                            <input id="inputColorpicker2" type="text" class="form-control" value="#04C4A5">
                            <span class="input-group-append">
                              <span class="input-group-text add-on">
                                <i class="align-self-center"></i>
                              </span>
                            </span>
                          </div>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="inputColorpicker3" class="control-label">Custom options</label>
                          <div id="colorpicker3" class="input-group input-group-alt">
                            <input id="inputColorpicker3" type="text" class="form-control" value="#C5906C">
                            <span class="input-group-append">
                              <span class="input-group-text add-on">
                                <i class="align-self-center"></i>
                              </span>
                            </span>
                          </div>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label">Disable alpha channel</label>
                          <div id="colorpicker4" class="input-group input-group-alt">
                            <input id="inputColorpicker4" type="text" class="form-control" value="#C5906C">
                            <span class="input-group-append">
                              <span class="input-group-text add-on">
                                <i class="align-self-center"></i>
                              </span>
                            </span>
                          </div>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="colorpicker5" class="control-label">Transparent color support</label>
                          <input id="colorpicker5" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="colorpicker6" class="control-label">Horizontal mode</label>
                          <input id="colorpicker6" type="text" class="form-control"> </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="colorpicker7" class="control-label">Inline mode</label>
                          <div class="d-block">
                            <div id="colorpicker7"></div>
                          </div>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="inputColorpicker8" class="control-label">Aliased color palette</label>
                          <div id="colorpicker8" class="input-group input-group-alt">
                            <input id="inputColorpicker8" type="text" class="form-control" value="#9474a9">
                            <span class="input-group-append">
                              <span class="input-group-text add-on">
                                <i class="align-self-center"></i>
                              </span>
                            </span>
                          </div>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label for="inputColorpicker9" class="control-label">Custom template</label>
                          <div class="d-block">
                            <div id="colorpicker9" data-color="#04C4A5"></div>
                          </div>
                        </div>
                        <!-- /.form-group -->
                        <!-- .form-group -->
                        <div class="form-group">
                          <label class="control-label">Inside a modal</label>
                          <div class="d-block">
                            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#cpModal">Show modal</button>
                          </div>
                          <!-- .modal -->
                          <div class="modal fade" id="cpModal" tabindex="-1" role="dialog" aria-labelledby="cpModalLabel" aria-hidden="true">
                            <!-- .modal-dialog -->
                            <div class="modal-dialog">
                              <!-- .modal-content -->
                              <div class="modal-content">
                                <!-- .modal-body -->
                                <div class="modal-body">
                                  <div id="colorpicker10" class="input-group input-group-alt">
                                    <input type="text" class="form-control" value="#4D9DE0">
                                    <span class="input-group-append">
                                      <span class="input-group-text add-on">
                                        <i class="align-self-center"></i>
                                      </span>
                                    </span>
                                  </div>
                                </div>
                                <!-- /.modal-body -->
                              </div>
                              <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                          </div>
                          <!-- /.modal -->
                        </div>
                        <!-- /.form-group -->
                      </form>
                      <!-- /form -->
                    </div>
                    <!-- /.card-body -->
                  </section>
                  <!-- /.card -->
                </div>
                <!-- /.section-deck -->
                <hr class="my-5">
                <!-- grid row -->
                <div class="row">
                  <!-- grid column -->
                  <div class="col-lg-4">
                    <!-- .section-block -->
                    <div class="section-block mt-0">
                      <h2 class="section-title pt-0"> Uploader </h2>
                      <p class="text-muted"> File Upload widget with multiple file selection, drag & drop support, progress bar, validation and preview images, audio and video. Supports cross-domain, chunked and resumable file uploads. Works with any server-side platform (Google
                        App Engine, PHP, Python, Ruby on Rails, Java, etc.) that supports standard HTML form file uploads. </p>
                    </div>
                    <!-- /.section-block -->
                  </div>
                  <!-- /grid column -->
                  <!-- grid column -->
                  <div class="col-lg-8">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- The avatar upload progress bar -->
                      <div id="progress-avatar" class="progress progress-xs rounded-0 fade">
                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <!-- .card-body -->
                      <div class="card-body">
                        <!-- .media -->
                        <div class="media">
                          <div class="user-avatar user-avatar-xl fileinput-button">
                            <div class="fileinput-button-label"> Change photo </div>
                            <img src="assets/images/avatars/profile.jpg" alt="User Avatar">
                            <input id="fileupload-avatar" type="file" name="avatar"> </div>
                          <div class="media-body pl-3">
                            <h3 class="card-title"> jQuery File Upload </h3>
                            <p class="card-text"> Click the current avatar to change your photo. </p>
                            <p class="card-text text-muted"> The maximum file size allowed is 2MB. </p>
                          </div>
                        </div>
                        <!-- /.media -->
                      </div>
                      <!-- /.card-body -->
                      <div id="avatar-warning-container" class="alert alert-danger fade mb-0"></div>
                    </section>
                    <!-- /.card -->
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <!-- The fileinput-button span is used to style the file input field as button -->
                        <label for="fileupload-customInput">Using custom input</label>
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" id="fileupload-customInput" multiple>
                          <label class="custom-file-label" for="customFile">Choose files</label>
                        </div>
                        <hr>
                        <label for="fileupload-customInput" class="mr-2">Using button</label>
                        <div class="btn btn-secondary fileinput-button">
                          <i class="fa fa-plus fa-fw"></i>
                          <span>Add files...</span>
                          <!-- The file input field used as target for the file upload widget -->
                          <input id="fileupload-btn" type="file" name="files[]" multiple> </div>
                        <hr>
                        <label for="fileupload-customInput">Using dropzone</label>
                        <div id="dropzone" class="fileinput-dropzone">
                          <span>Drop files or click to upload.</span>
                          <!-- The file input field used as target for the file upload widget -->
                          <input id="fileupload-dropzone" type="file" name="files[]" multiple> </div>
                      </div>
                      <!-- /.card-body -->
                      <!-- The progress bar -->
                      <div id="progress" class="progress progress-xs rounded-0 fade">
                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                      </div>
                      <!-- The container for the uploaded files -->
                      <div id="uploadList" class="list-group list-group-flush list-group-divider"></div>
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /grid column -->
                </div>
                <!-- /grid row -->
                <hr class="my-5">
                <!-- grid row -->
                <div class="row">
                  <!-- grid column -->
                  <div class="col-lg-4">
                    <!-- .section-block -->
                    <div class="section-block mt-0">
                      <h2 class="section-title pt-0"> Spinner </h2>
                      <p class="text-muted"> A mobile and touch friendly input spinner component. It supports the mousewheel and the up/down keys. </p>
                    </div>
                    <!-- /.section-block -->
                  </div>
                  <!-- /grid column -->
                  <!-- grid column -->
                  <div class="col-lg-8">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <!-- form -->
                        <form>
                          <!-- .form-group -->
                          <div class="form-group">
                            <label class="control-label" for="the-basics">Basic spinner</label>
                            <input type="text" value="" id="spinner1"> </div>
                          <!-- /.form-group -->
                          <!-- .form-group -->
                          <div class="form-group">
                            <label class="control-label" for="the-basics">With postfix</label>
                            <input type="text" value="55" id="spinner2"> </div>
                          <!-- /.form-group -->
                          <!-- .form-group -->
                          <div class="form-group">
                            <label class="control-label" for="the-basics">With prefix</label>
                            <input type="text" value="33" id="spinner3"> </div>
                          <!-- /.form-group -->
                          <!-- .form-group -->
                          <div class="form-group">
                            <label class="control-label" for="the-basics">Vertical button alignment</label>
                            <input type="text" value="55" id="spinner4"> </div>
                          <!-- /.form-group -->
                          <!-- .form-group -->
                          <div class="form-group">
                            <label class="control-label" for="the-basics">Vertical buttons with custom icons</label>
                            <input type="text" value="55" id="spinner5"> </div>
                          <!-- /.form-group -->
                        </form>
                        <!-- /form -->
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /grid column -->
                </div>
                <!-- /grid row -->
                <hr class="my-5">
                <!-- .section-block -->
                <div class="section-block">
                  <h2 class="section-title"> Slider </h2>
                  <p class="text-muted"> Lightweight JavaScript range slider library. It offers a wide selection of options and settings, and is compatible with a ton of (touch) devices, including those running iOS, Android, Windows 8/8.1/10, Windows Phone 8.1 and Windows Mobile
                    10. </p>
                </div>
                <!-- /.section-block -->
                <!-- .masonry-layout -->
                <div class="masonry-layout">
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> noUiSlider </h3>
                        <!-- .media -->
                        <div class="media">
                          <!-- .media-left -->
                          <div class="media-left">
                            <div class="text-truncate p-3" id="nouislider-colorpicker">
                              <div class="noUi-danger mr-4 d-inline-block" id="red" style="height:220px"></div>
                              <div class="noUi-success mr-4 d-inline-block" id="green" style="height:220px"></div>
                              <div class="noUi-info mr-4 d-inline-block" id="blue" style="height:220px"></div>
                            </div>
                          </div>
                          <!-- /.media-left -->
                          <!-- .media-body -->
                          <div class="media-body align-middle p-3">
                            <div class="bordered" id="ncp-result" style="width:100px;height:100px;background-color: rgb(128,128,128)"></div>
                          </div>
                          <!-- /.media-body -->
                        </div>
                        <!-- /.media -->
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Using HTML5 input elements </h3>
                        <div class="nouislider-wrapper">
                          <div id="html5"></div>
                        </div>
                        <!-- grid row -->
                        <div class="form-row">
                          <!-- grid column -->
                          <div class="col">
                            <select id="input-select" class="custom-select"> </select>
                          </div>
                          <!-- /grid column -->
                          <!-- grid column -->
                          <div class="col">
                            <input id="input-number" class="form-control" type="number" min="-20" max="40" step="1"> </div>
                          <!-- /grid column -->
                        </div>
                        <!-- /grid row -->
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Non linear slider </h3>
                        <div class="nouislider-wrapper">
                          <div id="nonlinear" class="noUi-danger"></div>
                        </div>
                        <span class="badge badge-info" id="lower-value"></span>
                        <span class="badge badge-info" id="upper-value"></span>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Colored Connect Elements </h3>
                        <p>
                          <button id="lockbutton" class="btn btn-secondary">Lock</button>
                        </p>
                        <p>
                          <span class="badge badge-info" id="slider1-span"></span>
                        </p>
                        <div class="nouislider-wrapper">
                          <div class="noUi-success" id="slider1"></div>
                        </div>
                        <p>
                          <span class="badge badge-info" id="slider2-span"></span>
                        </p>
                        <div class="nouislider-wrapper">
                          <div class="noUi-warning" id="slider2"></div>
                        </div>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Locking sliders together </h3>
                        <p> noUiSlider's connect elements can be individually colored or otherwise styled. </p>
                        <div class="nouislider-wrapper">
                          <div id="slider-color"></div>
                        </div>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Changing the slider by keypress </h3>
                        <div class="nouislider-wrapper">
                          <div id="keypress"></div>
                        </div>
                        <!-- grid row -->
                        <div class="form-row">
                          <!-- grid column -->
                          <div class="col">
                            <input type="text" id="input-with-keypress-1" class="form-control"> </div>
                          <!-- /grid column -->
                          <!-- grid column -->
                          <div class="col">
                            <input type="text" id="input-with-keypress-0" class="form-control"> </div>
                          <!-- /grid column -->
                        </div>
                        <!-- /grid row -->
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Skipping steps </h3>
                        <p> Notice how <code>40</code> and <code>80</code> can't be selected on the slider. </p>
                        <div class="nouislider-wrapper">
                          <div id="skipstep"></div>
                        </div>
                        <span id="skip-value-lower" class="badge badge-secondary"></span>
                        <span id="skip-value-upper" class="badge badge-secondary"></span>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Huge numbers </h3>
                        <p> If you are working with arbitrarily large numbers, you should
                          <strong>not use these directly in noUiSlider</strong>, as you'll run into some JavaScript limitations. Instead, you should
                          <strong>map</strong> your values to an <code>array</code>. </p>
                        <div class="nouislider-wrapper">
                          <div id="slider-huge"></div>
                        </div>
                        <div id="huge-value" class="help-block"></div>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Adding keyboard support </h3>
                        <p> Much like the keypress example, handles can be made keyboard-focusable. </p>
                        <div class="form-group">
                          <input class="form-control" placeholder="Hit tab to focus on the handle."> </div>
                        <div class="nouislider-wrapper">
                          <div id="keyboard"></div>
                        </div>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Working with dates </h3>
                        <div class="nouislider-wrapper">
                          <div id="slider-date"></div>
                        </div>
                        <span class="badge badge-info" id="event-start"></span>
                        <span class="badge badge-info" id="event-end"></span>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                  <!-- .masonry-item -->
                  <div class="masonry-item col-lg-6">
                    <!-- .card -->
                    <section class="card card-fluid">
                      <!-- .card-body -->
                      <div class="card-body">
                        <h3 class="card-title"> Soft limits </h3>
                        <div class="nouislider-wrapper mb-5">
                          <div id="slider-soft"></div>
                        </div>
                      </div>
                      <!-- /.card-body -->
                    </section>
                    <!-- /.card -->
                  </div>
                  <!-- /.masonry-item -->
                </div>
                <!-- /.masonry-layout -->
              </div>
              <!-- /.page-section -->
            </div>
            <!-- /.page-inner -->
          </div>
          <!-- /.page -->
        </div>
        <!-- .app-footer -->
@endsection
