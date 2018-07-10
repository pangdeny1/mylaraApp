<!-- Button trigger modal -->
<button class="btn btn-secondary btn-sm"
        data-toggle="modal"
        data-target="#membersModal{{ $cluster->id }}"
>
    {{ $cluster->farmers->count() }} Members
</button>

<!-- Farmers Modal -->
<div class="modal fade"
     id="membersModal{{ $cluster->id }}"
     tabindex="-1"
     role="dialog"
     aria-labelledby="membersModalLabel{{ $cluster->id }}"
     aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-overflow" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title"> Farmers </h6>
            </div>

            <div class="modal-body px-0">
                @foreach($cluster->farmers as $member)
                    <div class="list-group list-group-flush list-group-divider border">
                        <div class="list-group-item">
                            <!-- .list-group-item-figure -->
                            <div class="list-group-item-figure">
                                <a href="#" class="user-avatar">
                                    <img src="{{ Avatar::create($member->full_name)->toBase64() }}"
                                         alt="{{ $member->full_name }}"
                                    />
                                </a>
                            </div>

                            <div class="list-group-item-body">
                                <h4 class="list-group-item-title">
                                    <a href="#">{{ $member->full_name }}</a>
                                </h4>
                                <p class="list-group-item-text"> {{ $member->phone }} </p>
                            </div>

                            <div class="list-group-item-figure">
                                @if(! $member->hasHarvested($cluster))
                                <a href="{{ url("farmers/{$member->id}/harvests/create?batch_id={$cluster->id}") }}"
                                   class="btn btn-sm btn-primary"
                                >
                                    Add harvest
                                </a>
                                @else
                                    <div>
                                        <div>
                                            {{ $member->findHarvestByBatchId($cluster->id)->block->product->name }} -
                                            {{ $member->findHarvestByBatchId($cluster->id)->block->number }}
                                        </div>
                                        <div class="text-right">
                                            <span>
                                                {{ $member->findHarvestByBatchId($cluster->id)->volume }}
                                            </span>
                                        </div>
                                    </div>
                                @endif
                            </div>

                        </div>
                    </div>
                @endforeach
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>