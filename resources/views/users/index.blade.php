@extends("layouts.master")

@section("content")
    <div class="wrapper">
        <div class="page">
            <div class="page-inner">
                <header class="page-title-bar">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">
                                <a href="#">
                                    <i class="breadcrumb-icon fa fa-angle-left mr-2"></i>Users</a>
                            </li>
                        </ol>
                    </nav>
                    <div class="d-sm-flex align-items-sm-center">
                        <h1 class="page-title mr-sm-auto mb-0">
                            Users
                        </h1>
                        <div class="btn-toolbar">
                            <button type="button" class="btn btn-light">
                                <i class="oi oi-data-transfer-download"></i>
                                <span class="ml-1">Export</span>
                            </button>
                            <button type="button" class="btn btn-light">
                                <i class="oi oi-data-transfer-upload"></i>
                                <span class="ml-1">Import</span>
                            </button>
                            <a href="{{ route("users.create") }}" class="btn btn-primary">
                                <span class="fas fa-plus mr-1"></span>
                                Register a new user
                            </a>
                        </div>
                    </div>
                </header>

                <div class="page-section">
                    <section class="card shadow-1 border-0 card-fluid">
                        <header class="card-header">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->query("status") ? "" : "active" }}" href="{{ route("purchases.index") }}">
                                        List of all users
                                    </a>
                                </li>
                            </ul>
                        </header>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Full name</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Roles</th>
                                            <th>Permissions</th>
                                            <th>Created at</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($users as $user)
                                        <tr>
                                            <td class="align-middle">
                                                <a href="{{ route("users.show", $user) }}">
                                                    {{ $user->full_name }}
                                                </a>
                                            </td>
                                            <td class="align-middle">{{ $user->phone }}</td>
                                            <td class="align-middle">{{ $user->email }}</td>
                                            <td class="align-middle text-capitalize">
                                                {{ $user->roles->count() }}
                                                {{ str_plural("role", $user->roles->count()) }}
                                            </td>
                                            <td class="align-middle text-capitalize">
                                                {{ $user->getAbilities()->count() }}
                                                {{ str_plural("permission", $user->getAbilities()->count()) }}
                                            </td>
                                            <td class="align-middle">{{ $user->created_at }}</td>
                                            <td class="align-middle text-right">
                                                <a href="{{ route("users.edit", $user) }}" class="btn btn-sm btn-secondary">
                                                    <i class="fa fa-pencil-alt"></i>
                                                    <span class="sr-only">Edit</span>
                                                </a>
                                                <a href="javascript:void(0)"
                                                   class="btn btn-sm btn-secondary"
                                                   onclick="event.preventDefault(); document.getElementById('deletion-form-{{$user->id}}').submit();"
                                                >
                                                    <i class="far fa-trash-alt"></i>
                                                    <span class="sr-only">Remove</span>
                                                    <form id="deletion-form-{{$user->id}}"
                                                          action="{{ route('users.destroy', $user) }}"
                                                          method="POST"
                                                          class="d-none"
                                                    >
                                                        @csrf
                                                        @method("delete")
                                                    </form>
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>

                            <!-- .pagination -->
                            {{ $users->links() }}
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
@endsection