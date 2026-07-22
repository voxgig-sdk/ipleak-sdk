<?php
declare(strict_types=1);

// Ipleak SDK base feature

class IpleakBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(IpleakContext $ctx, array $options): void {}
    public function PostConstruct(IpleakContext $ctx): void {}
    public function PostConstructEntity(IpleakContext $ctx): void {}
    public function SetData(IpleakContext $ctx): void {}
    public function GetData(IpleakContext $ctx): void {}
    public function GetMatch(IpleakContext $ctx): void {}
    public function SetMatch(IpleakContext $ctx): void {}
    public function PrePoint(IpleakContext $ctx): void {}
    public function PreSpec(IpleakContext $ctx): void {}
    public function PreRequest(IpleakContext $ctx): void {}
    public function PreResponse(IpleakContext $ctx): void {}
    public function PreResult(IpleakContext $ctx): void {}
    public function PreDone(IpleakContext $ctx): void {}
    public function PreUnexpected(IpleakContext $ctx): void {}
}
