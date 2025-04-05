<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
            'role' => 'admin'
        ]);

        User::create([
            'name' => 'Author One',
            'email' => 'author1@example.com',
            'password' => Hash::make('password'),
            'role' => 'author'
        ]);

        User::create([
            'name' => 'Author Two',
            'email' => 'author2@example.com',
            'password' => Hash::make('password'),
            'role' => 'author'
        ]);
    }
}
