<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

use App\Models\Category;
class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    
    public function run(): void
    {
        $categories = ['Technology', 'Science', 'Health', 'Business', 'Lifestyle'];

        $admin = User::where('role', 'admin')->first();

        foreach ($categories as $category) {
            Category::create([
                'name' => $category,
                'slug' => \Str::slug($category),
                'user_id' => $admin->id
            ]);
        }
    }
}
