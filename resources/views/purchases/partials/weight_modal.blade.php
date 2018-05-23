@if($purchase->weight_after_processing)
    {{ $purchase->weight_after_processing }}
    {{ $purchase->weight_unit }}
@else
    <!-- Button trigger modal -->
    <button type="button"
            class="btn btn-sm btn-default"
            data-toggle="modal"
            data-target="#purchase-{{ $purchase->id }}"
    >
        <span class="fas fa-plus mr-1"></span> Record
    </button>
    <!-- Modal -->
    <div class="modal fade"
         id="purchase-{{ $purchase->id }}"
         tabindex="-1"
         role="dialog"
         aria-labelledby="modal-label"
         aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <form action="{{ route("purchases.weights.update", $purchase) }}"
                  method="post"
                  class="modal-content"
            >
                @csrf
                @method("patch")
                <header class="modal-header border-bottom-0">
                    <h5 class="modal-title" id="modal-label">
                        Record weight after processing
                    </h5>
                    <button type="button"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close">
                    </button>
                </header>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-4 text-left">
                            <label for="weight_after">
                                Unit
                            </label>
                            <input type="text"
                                   name="weight_after"
                                   id="weight_after"
                                   class="form-control"
                                   value="{{ $purchase->weight_unit }}"
                            >
                        </div>
                        <div class="form-group col-md-4 text-left">
                            <label for="weight_after">
                                Before
                            </label>
                            <input type="text"
                                   name="weight_after"
                                   id="weight_after"
                                   class="form-control"
                                   value="{{ $purchase->weight_before_processing }}"
                            >
                        </div>
                        <div class="form-group col-md-4 text-left">
                            <label for="weight_after">
                                After processing
                            </label>
                            <input type="text"
                                   name="weight_after"
                                   id="weight_after"
                                   class="form-control"
                            >
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group text-left col-md-12">
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
                </div>
                <footer class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-primary">
                        Save changes
                    </button>
                </footer>
            </form>
        </div>
    </div>
@endif