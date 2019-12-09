module typef
import (
	time
)

enum Type_Options {
	lin quad pow poly err
}

pub fn set_type(id int) Type_Options {
	mut funct_type := Type_Options.err
	if id == 0 {
		funct_type = .lin
	}
	else if id == 1 {
		funct_type = .quad
	}

	else if id == 2 {
		funct_type = .pow
	}
	else if id == 3 {
		funct_type = .poly
	}
	else {
		funct_type = .err
	}
	return funct_type
}

pub fn get_type(id int) []int {
	mut arr := []int

	if id == 0 {
		arr = get_lin()
	}
	else if id == 1 {
		arr = get_quad()
	}

	else if id == 2 {
		arr = get_pow()
	}
	else if id == 3 {
		arr = get_poly()
	}
	else {
		panic('error function type entered !!')
	}
	return arr
}


fn get_pow() []int {
	return [0].repeat(1)
}

fn get_lin() []int {
	return [0].repeat(2)
}

fn get_quad() []int {
	return [0].repeat(3)
}

fn get_poly() []int {
	return [0].repeat(4)
}

fn test_pow() string {
	suc := "power type passed test"
	test_p := [0].repeat(1)
	assert test_p.len == get_pow().len
	return suc
}

fn test_lin() string {
	suc := "linear type passed test"
	test_l := [0].repeat(2)
	assert test_l.len == get_lin().len
	return suc
}
fn test_quad() string {
	suc := "quad type passed test"
	test_q := [0].repeat(3)
	assert test_q.len == get_quad().len
	return suc
}
fn test_poly() string {
	suc := "poly type passed test"
	test_ply := [0].repeat(4)
	assert test_ply.len == get_poly().len
	return suc
}

pub fn run_tests() {
	t := time.now()
	mut tests_res := []string
	tests_res << test_lin()
	time.sleep_ms(10)
	tests_res << test_poly()
	time.sleep_ms(10)
	tests_res << test_quad()
	time.sleep_ms(10)
	tests_res << test_pow()
	time.sleep_ms(10)
	tests_res << t.format()
	println(tests_res)
}

fn main() {
	run_tests()
}