@component('mail::message')
# Account activation

To activate your account please click the button below.

@component('mail::button', ['url' => ''])
Activate
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
