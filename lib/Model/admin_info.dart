class SocialMediaLinks {
  final String instagram;
  final String contactUs;
  final String facebook;
  final String twitter;
  final String pintrest;
  final String privacyPolicy;
  final String shippingPolicy;
  final String termsOfService;

  SocialMediaLinks({
    required this.instagram,
    required this.contactUs,
    required this.facebook,
    required this.twitter,
    required this.pintrest,
    required this.privacyPolicy,
    required this.shippingPolicy,
    required this.termsOfService,
  });

  // Factory method to create an instance from a map
  factory SocialMediaLinks.fromMap(Map<String, dynamic> map) {
    return SocialMediaLinks(
      instagram: map['instagram'] ?? '',
      contactUs: map['contactus'] ?? '',
      facebook: map['facebook'] ?? '',
      twitter: map['twitter'] ?? '',
      pintrest: map['pintrest'] ?? '',
      privacyPolicy: map['privacypolicy'] ?? '',
      shippingPolicy: map['shippingpolicy'] ?? '',
      termsOfService: map['termsofservice'] ?? '',
    );
  }

  // Method to convert the instance to a map
  Map<String, dynamic> toMap() {
    return {
      'instagram': instagram,
      'contactus': contactUs,
      'facebook': facebook,
      'twitter': twitter,
      'pintrest': pintrest,
      'privacypolicy': privacyPolicy,
      'shippingpolicy': shippingPolicy,
      'termsofservice': termsOfService,
    };
  }
}
