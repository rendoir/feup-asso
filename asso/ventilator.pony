actor Ventilator
    """
    Actor that manages Consumer's subscriptions.
    """

    let _id: USize
    let _out: OutStream
    let _queue : Queue

    """
    Array to hold the subscribers.
    """
    let _subscribers: Array[Consumer]

    new create(id: USize, queue: Queue, out: OutStream) =>
        _id = id
        _queue = queue
        _out = out
        _subscribers = Array[Consumer]()

    be publish_message(queue: Queue) =>
        _out.print("TODO")

    be push_message(queue: Queue) =>
        _out.print("TODO")

    be can_produce(publisher: Publisher) =>
        _queue.can_produce(publisher)

    be add_subscriber(consumer: Consumer) =>
        _subscribers.push(consumer)

    be consume_message() =>
        _queue.can_consume(this)
    
    be on_message(m: Message) =>
        for sub in _subscribers.values() do
            sub.on_message(m)
        end
    
