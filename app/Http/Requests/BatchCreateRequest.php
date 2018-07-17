<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BatchCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            "number" => "required",
            "valid_from" => "required|date|after_or_equal:today",
            "valid_till" => "required|date|after:today",
            "max_count" => "required|numeric",
            "description" => "required",
            "farmers" => "required|array",
        ];
    }
}
