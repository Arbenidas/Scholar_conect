import 'package:flutter/material.dart';

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final MessageType type;
  final String? attachmentUrl;
  final String? attachmentName;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
    this.isRead = false,
    this.type = MessageType.text,
    this.attachmentUrl,
    this.attachmentName,
  });

  bool get isAttachment => type == MessageType.attachment;

  Message copyWith({
    String? id,
    String? senderId,
    String? receiverId,
    String? content,
    DateTime? timestamp,
    bool? isRead,
    MessageType? type,
    String? attachmentUrl,
    String? attachmentName,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
      attachmentName: attachmentName ?? this.attachmentName,
    );
  }
}

enum MessageType {
  text,
  attachment,
}

class Conversation {
  final String id;
  final String scholarshipId;
  final String scholarshipTitle;
  final String organizationId;
  final String organizationName;
  final String organizationImageUrl;
  final List<Message> messages;
  final DateTime lastMessageTime;
  final bool hasUnreadMessages;
  final ConversationStatus status;

  Conversation({
    required this.id,
    required this.scholarshipId,
    required this.scholarshipTitle,
    required this.organizationId,
    required this.organizationName,
    required this.organizationImageUrl,
    required this.messages,
    required this.lastMessageTime,
    this.hasUnreadMessages = false,
    this.status = ConversationStatus.active,
  });

  String get lastMessageContent {
    if (messages.isEmpty) return '';
    final lastMessage = messages.last;
    if (lastMessage.isAttachment) {
      return '📎 ${lastMessage.attachmentName ?? 'Attachment'}';
    }
    return lastMessage.content;
  }

  int get unreadCount {
    return messages
        .where(
            (message) => !message.isRead && message.receiverId == 'currentUser')
        .length;
  }
}

enum ConversationStatus {
  active,
  archived,
  pending,
}
