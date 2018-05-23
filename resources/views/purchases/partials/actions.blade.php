<div class="dropdown">
    <button type="button" class="btn btn-sm btn-light" data-toggle="dropdown">
        <span>More</span>
        <span class="caret"></span>
    </button>

    <div class="dropdown-arrow dropdown-arrow-right"></div>

    <div class="dropdown-menu dropdown-menu-right">

        <a href="{{ route("purchases.show", $purchase) }}"
           class="dropdown-item"
        >
            <i class="far fa-file"></i> View
        </a>
        <a href="{{ route("purchases.edit", $purchase) }}"
           class="dropdown-item"
        >
            <i class="far fa-edit"></i> Edit
        </a>

        <div class="dropdown-divider"></div>

        <a href="javascript:void(0)"
           class="dropdown-item"
           onclick="event.preventDefault(); document.getElementById('rejection-form-{{$purchase->id}}').submit();"
        >
            <i class="far fa-times-circle"></i> Reject
            <form id="rejection-form-{{$purchase->id}}"
                  action="{{ route('purchases.rejections', $purchase) }}"
                  method="POST"
                  class="d-none"
            >
                @csrf
                @method("delete")
            </form>
        </a>
        @if($purchase->weight_after_processing)
        <a href="javascript:void(0)"
           class="dropdown-item"
           onclick="event.preventDefault(); document.getElementById('acceptance-form-{{$purchase->id}}').submit();"
        >
            <i class="far fa-check-circle"></i> Accept
            <form id="acceptance-form-{{$purchase->id}}"
                  action="{{ route('purchases.acceptances', $purchase) }}"
                  method="POST"
                  class="d-none"
            >
                @csrf
            </form>
        </a>
        @endif
        <a href="javascript:void(0)"
           class="dropdown-item"
        >
            <i class="far fa-comment"></i> Remark
        </a>
        <div class="dropdown-divider"></div>
        <a href="javascript:void(0)"
           class="dropdown-item"
           onclick="event.preventDefault(); document.getElementById('deletion-form-{{$purchase->id}}').submit();"
        >
            <i class="far fa-trash-alt"></i> Delete
            <form id="deletion-form-{{$purchase->id}}"
                  action="{{ route('purchases.destroy', $purchase) }}"
                  method="POST"
                  class="d-none"
            >
                @csrf
                @method("delete")
            </form>
        </a>
    </div>
</div>