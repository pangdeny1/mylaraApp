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
            "valid_from" => "required|date",
            "valid_till" => "required|date",
            "max_count" => "required|numeric",
            "description" => "required",
            "block_id" => "required",
            "group_id" => "required",
            "expected_harvest_time" => "required|date",
            "expected_delivery_time" => "required|date",
            "expected_departure_time" => "required|date",
        ];
    }
}
