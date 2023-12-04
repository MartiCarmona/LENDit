export default class extends Controller {
  static targets = ['messages', 'input'];

  connect() {
    this.setupSubscription();
  }

  setupSubscription() {
    const chatId = this.data.get('chatId');
    if (chatId) {
      const chatChannel = consumer.subscriptions.create({ channel: 'ChatChannel', chat_id: chatId }, {
        received: (data) => {
          this.appendMessage(data);
        },
      });

      this.chatChannel = chatChannel;
    }
  }

  appendMessage(data) {
    const messageElement = document.createElement('div');
    const isCurrentUser = data.user_id === parseInt(this.data.get('currentUserId'));

    // Apply different styles based on the sender
    messageElement.classList.add(isCurrentUser ? 'message-right' : 'message-left');

    messageElement.innerHTML = `<p><strong>${data.user_name}:</strong> ${data.message}</p>`;
    this.messagesTarget.appendChild(messageElement);
  }

  sendMessage() {
    const content = this.inputTarget.value;
    if (content.trim() !== '') {
      const chatId = this.data.get('chatId');
      this.chatChannel.send({ content, chat_id: chatId });
      this.inputTarget.value = '';
    }
  }
}
