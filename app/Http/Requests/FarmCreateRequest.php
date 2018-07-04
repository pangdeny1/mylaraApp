<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FarmCreateRequest extends FormRequest
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
            "size" => "required|numeric",
            "size_unit" => ["required", Rule::in(["acre"])],
            "description" => "required",
            "crops" => "required|array",
            "block_number" => "required",
            "block_description" => "required",
            "country" => "required",
            "state" => "required",
        ];
    }
}