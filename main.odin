package main

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

import "gol"

WindowProps :: struct {
  w:     i32,
  h:     i32,
  title: cstring,
  debug: bool,
}
window :: WindowProps{1280, 720, "ORC - Odin Raylib Conway", true}

cell_size :: 12

cols :: window.w / cell_size
rows :: window.h / cell_size
world_w_remainder :: window.w % cell_size
world_h_remainder :: window.h % cell_size
grid: [rows][cols]bool

main :: proc() {
  fmt.println("Running!")

  rl.InitWindow(window.w, window.h, window.title)
  defer rl.CloseWindow()

  grid[10][10] = true
  grid[10][11] = true
  grid[11][10] = true

  for !rl.WindowShouldClose() {
    rl.BeginDrawing()
    rl.ClearBackground(rl.BLACK)

    draw_grid()

    rl.EndDrawing()
  }
}

draw_grid :: proc() {
  for row, y in grid {
    for alive, x in row {
      posx := cast(i32)x * cell_size
      posy := cast(i32)y * cell_size

      if alive {
        rl.DrawRectangle(posx, posy, cell_size, cell_size, rl.RAYWHITE)
      }
      rl.DrawRectangleLines(
        posx,
        posy,
        cell_size,
        cell_size,
        {100, 100, 100, 100},
      )
    }
  }
}
