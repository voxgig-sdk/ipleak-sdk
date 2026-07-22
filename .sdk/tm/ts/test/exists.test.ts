
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { IpleakSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await IpleakSDK.test()
    equal(null !== testsdk, true)
  })

})
