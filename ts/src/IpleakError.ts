
import { Context } from './Context'


class IpleakError extends Error {

  isIpleakError = true

  sdk = 'Ipleak'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  IpleakError
}

