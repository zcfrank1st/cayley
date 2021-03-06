// GO SOURCE FILE MACHINE GENERATED BY RAGEL; DO NOT EDIT

// Copyright 2014 The Cayley Authors. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cquads

import (
	"fmt"
	"unicode"

	"github.com/cayleygraph/cayley/quad"
)

%%{
	machine quads;

	include "actions.rl";

	include "cquads.rl";

	write data;
}%%

// Parse returns a valid quad.Quad or a non-nil error. Parse does
// handle comments except where the comment placement does not prevent
// a complete valid quad.Quad from being defined.
func Parse(statement string) (quad.Quad, error) {
	data := []rune(statement)

	var (
		cs, p int
		pe    = len(data)
		eof   = pe

		subject   = -1
		predicate = -1
		object    = -1
		label     = -1

		spec = -1

		isEscaped bool
		isQuoted  bool

		q quad.Quad
	)

	%%write init;

	%%write exec;

	return quad.Quad{}, quad.ErrInvalid
}
