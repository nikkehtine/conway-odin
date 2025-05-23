package main

import "core:fmt"
import rl "vendor:raylib"

x :: 1280
y :: 720
title :: "ORC - Odin Raylib Conway"

main :: proc() {
	fmt.println("Running!")

	rl.InitWindow(x, y, title)
	defer rl.CloseWindow()

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		draw_grid()

		rl.EndDrawing()
	}
}
