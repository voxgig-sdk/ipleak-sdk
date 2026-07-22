package core

type IpleakError struct {
	IsIpleakError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewIpleakError(code string, msg string, ctx *Context) *IpleakError {
	return &IpleakError{
		IsIpleakError: true,
		Sdk:              "Ipleak",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *IpleakError) Error() string {
	return e.Msg
}
