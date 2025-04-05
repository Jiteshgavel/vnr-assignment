<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Cache;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Cache::remember('categories_all', now()->addMinutes(10), function () {
            return Category::all();
        });

        return response()->json($categories);
    }

    

    public function show(Category $category)
    {
        return $category;
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|unique:categories',
            'slug' => 'nullable|string|unique:categories',
        ]);

        $data['slug'] = $data['slug'] ?? Str::slug($data['name']);

        $data['user_id'] = auth()->id();

        $category = Category::create($data);
        Cache::forget('categories_all');

        return response()->json($category, 201);
    }

    public function update(Request $request, Category $category)
    {
        $data = $request->validate([
            'name' => 'sometimes|required|string|unique:categories,name,' . $category->id,
            'slug' => 'nullable|string|unique:categories,slug,' . $category->id,
        ]);

        if (isset($data['name']) && empty($data['slug'])) {
            $data['slug'] = Str::slug($data['name']);
        }

        $data['user_id'] = auth()->id();
        $category->update($data);
        Cache::forget('categories_all');
        return response()->json($category);
    }

    public function destroy(Category $category)
    {
        $category->delete();
        Cache::forget('categories_all');
        return response()->json(['message' => 'Category deleted successfully']);
    }
}

