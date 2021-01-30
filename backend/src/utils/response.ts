import * as HttpStatus from 'http-status-codes'

interface Options {
	statusCode: number
	message?: string
	status?: string
}

export class HttpResponse {
	public readonly statusCode: number
	public readonly message: string
	public readonly status: string
	constructor(options: Options) {
		const { status, message, statusCode } = options
		try {
			this.status = status || HttpStatus.getStatusText(options.statusCode)
		} catch (e) {
			this.status = 'Unknown'
		}
		this.message = message || this.status
		this.statusCode = statusCode
	}
}

export class Success extends HttpResponse {
	constructor(message?: string) {
		super({ statusCode: 200, message })
	}
}

export class BadRequest extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 400, message, status })
	}
}

export class Unauthorized extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 401, message, status })
	}
}

export class NotFound extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 404, message, status })
	}
}

export class MethodNotAllowed extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 405, message, status })
	}
}

export class RequestTimeout extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 408, message, status })
	}
}

export class ExpectationFailed extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 417, message, status })
	}
}
export class NotImplemented extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 501, message, status })
	}
}

export class ServiceUnavailable extends HttpResponse {
	constructor(message?: string, status?: string) {
		super({ statusCode: 503, message, status })
	}
}