module main

struct Range {
mut:
	a int		//beginning of range
	b int		//ending of range
}

fn initialize_range(A int, B int) Range {
	return Range{a: A, b: B} 
}

fn (r mut Range) set_range(A int, B int) {
	r.a = A
	r.b = B
}

fn (r Range) get_range() []int {
	mut range := []int
	range << r.a
	range << r. b
	return range
}

fn main() {
	mut rang := initialize_range(0, 5)
	println(rang.get_range())
	rang.set_range(-1, 1)
	println(rang.get_range())
}