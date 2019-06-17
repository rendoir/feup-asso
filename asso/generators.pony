use "time"

class PublisherGen is TimerNotify
    let _publisher: Publisher
    let _queue: Queue
    
    new iso create(publisher: Publisher, queue: Queue) =>
        _publisher = publisher
        _queue = queue

    fun ref apply(timer: Timer, count: U64): Bool =>
        _publisher.publish_message(_queue)
        true

class ConsumerGen is TimerNotify
    let _consumer: Consumer
    let _queue: Queue
    
    new iso create(consumer: Consumer, queue: Queue) =>
        _consumer = consumer
        _queue = queue

    fun ref apply(timer: Timer, count: U64): Bool =>
        _consumer.consume_message(_queue)
        true